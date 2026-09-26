# CF_VMON behavioral model

Ideal functional model for digital simulation. It is **not** SPICE-accurate
and it is **not** silicon-verified. Do not add this file to OpenLane
`VERILOG_FILES`.

## Files

| File | Replaces |
|---|---|
| `CF_VMON_core.v` | `hdl/gl/CF_VMON_core.v` |

Keep the customer wrap in `hdl/gl/CF_VMON.v`. Do **not** compile the empty
`hdl/gl/CF_VMON_core.v` stub in the same sim (duplicate module name).

```bash
./verify/beh_model/run_tb.sh
```

## Behavior

Ideal supply supervisor. `vpwr_v` and `vca_v` are the digital and analog rails. Precise-POR outputs are high at or above an assumed 1.6 V. Low-voltage indicators assert below 1.6 V. `HVI_OUT` asserts above an assumed 2.2 V on `vca_v`.
