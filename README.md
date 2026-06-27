# Personal Problem-Solving Snaps

Local Snapcraft projects for packaging small wrappers and environment fixes.

These snaps are personal infrastructure. They should prefer small, auditable
launchers over vendoring large third-party payloads, especially when the payload
is proprietary.

## Snaps

- `davinci-resolve/` — classic host-wrapper snap for a host-installed DaVinci
  Resolve at `/opt/resolve`.

## Build Pattern

Build from the specific snap directory:

```bash
cd davinci-resolve
snapcraft --destructive-mode
```

