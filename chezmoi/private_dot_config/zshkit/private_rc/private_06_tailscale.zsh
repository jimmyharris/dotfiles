_tailscale_path="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
if [[ -x "$_tailscale_path" ]]; then
  alias tailscale="$_tailscale_path"
fi

