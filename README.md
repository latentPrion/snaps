# DaVinci Resolve Host Snap

Local classic snap wrapper for a host-installed DaVinci Resolve at `/opt/resolve`.

This snap does not redistribute DaVinci Resolve. The snap packages only a launcher
that starts the host binary with a controlled library environment.

## Why this exists

On Ubuntu 24.04, Resolve can fail before the UI opens with:

```text
/opt/resolve/bin/resolve: symbol lookup error:
/lib/x86_64-linux-gnu/libpango-1.0.so.0:
undefined symbol: g_once_init_leave_pointer
```

The immediate cause is a mixed library stack:

- Resolve loads its bundled `/opt/resolve/libs/libglib-2.0.so.0`.
- Ubuntu's system `libpango-1.0.so.0` is then loaded.
- System Pango expects the newer GLib symbol `g_once_init_leave_pointer`.
- Resolve's bundled GLib does not export that symbol.

The wrapper preloads the host GLib-family libraries so system Pango binds to a
compatible GLib before Resolve's bundled library path can win.

## Build

```bash
snapcraft --destructive-mode
```

## Install Locally

```bash
sudo snap install --dangerous --classic ./davinci-resolve-host_*.snap
```

## Run

```bash
davinci-resolve-host
```

The desktop entry is also named **DaVinci Resolve (Host Snap)**.

## Configuration

Environment variables:

- `DAVINCI_RESOLVE_ROOT`: override the Resolve install path. Default:
  `/opt/resolve`.
- `DAVINCI_RESOLVE_USE_SYSTEM_GLIB`: set to `0` to disable the GLib preload
  behavior.

