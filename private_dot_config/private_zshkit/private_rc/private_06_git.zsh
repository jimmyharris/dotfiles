if [ -x "$(which git)" ]; then
	alias g=git

  if [ -d /usr/lib/git-core ]; then
    path=($path /usr/lib/git-core)
  fi

  # Git submodule Completion:
  _git-submodule () {
    local curcontext=$curcontext state line
    declare -A opt_args

    _arguments -C \
      '(- :)--quiet[display version information]' \
      ':command:->command' \
      '*::options:->options' && ret=0

    case $state in
      (command)
        declare -a commands

        commands=(
        'add:add a repository to this project as a submodule'
        'status:show status of the submodules'
        'init:initialize the submodules'
        'update:update registered submodules'
        'summary:show commit summary between given commit and index/working tree'
        'foreach:run a shell command in each checked out submodule'
        'sync:syncronizes submodules.')
        _describe -t commands command commands && ret=0
        ;;
      (options)
        declare -a arguments

        if [[ $line[1] == (fetch|clone|dcommit|set-tree|rebase|migrate|init) ]]; then
          arguments+=(
          '--username=[username to use for SVN transport]:username:_users'
          '--config-dir=[undocumented]:configuration directory:_directories'
          '--no-auth-cache[undocumented]')
        fi

        if [[ $line[1] == (fetch|clone|dcommit|set-tree|rebase|log) ]]; then
          arguments+=(
          '(   --authors-file)'$author_conversion_file_arg
          '(-A               )'$long_author_conversion_file_arg)
        fi

        # TODO: --repack-flags can be improved by actually completing the legal
        # flags to git-repack.
        if [[ $line[1] == (fetch|clone|dcommit|set-tree|rebase) ]]; then
          arguments+=(
          '(-q --quiet)'{-q,--quiet}'[make git-svn less verbose]'
          '--repack=[repack files (for given number of revisions)]:: :_guard "[[\:digit\:]]#" "revision limit"'
          '(--repack-flags --repack-args --repack-opts)'{--repack-flags=,--repack-args=,--repack-opts=}'[flags to pass to git-repack]:git-repack flags'
          '(                --no-follow-parent)--follow-parent[follow parent commit]'
          '(--follow-parent                   )--no-follow-parent[do not follow parent commit]'
          '--log-window-size=[undocumented]')
        fi

        if [[ $line[1] == (clone|init) ]]; then
          arguments+=(
          $shared_arg
          $template_arg
          '(-T --trunk)'{-T-,--trunk=}'[set trunk sub-directory]:trunk sub-directory:->subdirectory'
          '(-t --tags)'{-t-,--tags=}'[set tags sub-directory]:tags sub-directory:->subdirectory'
          '(-b --branches)'{-b-,--branches=}'[set branches sub-directory]:branches sub-directory:->subdirectory'
          '--stdlayout[shorthand for setting trunk,tags,branches as relative paths, the SVN default]'
          '--no-metadata[set svn-remote.X.noMetadata]'
          '--use-svm-props[set svn-remote.X.useSvmProps]'
          '--use-svnsync-props[set svn-remote.X.useSvnsyncProps]'
          '--rewrite-root=[set svn-remote.X.rewriteRoot]:new root'
          '--use-log-author[use author from the first From: or Signed-Off-By: line, when fetching into git]'
          '--add-author-from[when committing to svn, append a From: line based on the git commit'\''s author string]'
          '--prefix=[prefix to use for names of remotes]:path prefix:_directories -r ""')
        fi

        if [[ $line[1] == (dcommit|set-tree|commit-diff) ]]; then
          arguments+=(
          '--rmdir[remove empty directories from SVN tree after commit]'
          '(-e --edit)'{-e,--edit}'[edit commit message before committing]'
          $find_copies_harder_arg
          $diff_l_arg
          '(-C --copy-similarity)'{-C-,--copy-similarity=}'[undocumented]:number')
        fi

        if [[ $line[1] == (fetch|clone|log|create-ignore|info|propget|proplist|show-externals) ]]; then
          arguments+=(
          '(-r --revision)'{-r,--revision}'[only fetch given revision or revision range]:revision:->__git_svn_revisions'
          '::svn remote:__git_svn-remotes')
        fi

        if [[ $line[1] == (dcommit|rebase) ]]; then
          arguments+=(
          '(-m --merge)'{-m,--merge}'[use merging strategies, if necessary]'
          '*'{-s,--strategy=-}'[use given merge strategy]:merge strategy:__git_merge_strategies')
        fi

        if [[ $line[1] == (fetch|dcommit|rebase) ]]; then
          arguments+=(
          '(--fetch-all --all)'{--fetch-all,--all}'[undocumented]')
        fi

        if [[ $line[1] == (dcommit|log|rebase) ]]; then
          arguments+=(
          '(-v --verbose)'{-v,--verbose}'[output extra information]')
        fi

        case $line[1] in
          (clone)
            arguments+=(
            ':url:_urls'
            '::directory:_directories')
            ;;
          (set-tree)
            arguments+=('--stdin[read list of commits to commit from stdin]')
            ;;
          (show-ignore)
            arguments+=('-r --revision)'{-r,--revision}'[undocumented]:revision:->__git_svn_revisions')
            ;;
          (dcommit)
            arguments+=(
            '(-n --dry-run)'{-n,--dry-run}'[output git-commands that would show diffs that would be committed]'
            '--no-rebase[do not rebase or reset after committing]'
            '--commit-url[commit to a different SVN url]:SVN URL:_url')
            ;;
          (branch)
            arguments+=(
            '(-m --message)'{-m,--message}'[specify the commit message]:message'
            '(-t --tag)'{-t,--tag}'[create a tag]')
            ;;
          (migrate)
            arguments+=(
            '--minimize[undocumented]')
            ;;
          (log)
            __git_setup_revision_arguments

            arguments+=(
            $revision_arguments
            '(-r --revision)'{-r-,--revision=}'[revisions to output log information for]: :__git_svn_revision_numbers'
            '--limit=[like --max-count, but not counting merged/excluded commits]: :_guard "[[\:digit\:]]#" limit'
            '--incremental[give output suitable for concatenation]'
            '--show-commit[output git commit SHA-1, as well]'
            '--oneline[similar to --pretty=oneline]'
            '--color[undocumented]'
            '--pager[undocumented]:pager:_files -g *(*)'
            '--non-recursive[undocumented]')
            ;;
          (blame)
            arguments+=(
            '--git-format[produce output in git-blame format, with SVN revision numbers instead of git commit hashes]')
            ;;
          (rebase)
            arguments+=(
            '--local[do not fetch remotely, rebase against the last fetched commit from SVN]')
            ;;
          (commit-diff)
            arguments+=(
            '(-m --message)'{-m-,--message=}'[undocumented]:message'
            '(-F --file)'{-F-,--file=}'[undocumented]:file:_files'
            '(-r --revision)'{-r-,--revision=}'[undocumented]:revision:__git_svn_revisions')
            ;;
        esac

        _arguments -C \
          '(-h -H --help)'{-h,-H,--help}'[display usage information]' \
          '(-V --version)'{-V,--version}'[display version information]' \
          '--minimize-connections[undocumented]' \
          '(-R --svn-remote --remote)'{-R,--svn-remote,--remote}'[svn remote to use]:svn remote:__git_svn-remotes' \
          '(-i --id)'{-i,--id}'[set GIT_SVN_ID]:GIT_SVN_ID' \
          $arguments && ret=0

        case $state in
          (subdirectory)
            _alternative \
              'sub-directories:sub-directory:_directories' \
              'urls: :_urls' && ret=0
            ;;
        esac
        ;;
    esac
  }
fi
