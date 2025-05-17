Built by https://github.com/enjoy-digital/litex/

Generated with:

```
./olimex_gatemate_a1_evb.py --build --cpu-type=femtorv
```

Also added this patch to make I2C available

```
diff --git a/litex_boards/targets/olimex_gatemate_a1_evb.py b/litex_boards/targets/olimex_gatemate_a1_evb.py
index f5b2ade..e4ae855 100755
--- a/litex_boards/targets/olimex_gatemate_a1_evb.py
+++ b/litex_boards/targets/olimex_gatemate_a1_evb.py
@@ -84,6 +84,15 @@ class BaseSoC(SoCCore):
                 pads         = platform.request_all("user_led_n"),
                 sys_clk_freq = sys_clk_freq)
 
+        # I2C --------------------------------------------------------------------------------------
+        from litex.build.generic_platform import Subsignal, Pins
+        from litex.soc.cores.bitbang import I2CMaster
+        platform.add_extension([("i2c", 0,
+            Subsignal("sda",   Pins("IO_EA_B1")),
+            Subsignal("scl",   Pins("IO_EA_A1")),
+        )])
+        self.i2c = I2CMaster(pads=platform.request("i2c"))
+
 # Build --------------------------------------------------------------------------------------------
 
 def main():
```

Note: Olimex board, connecting over UEXT or over PMOD pins does not work.
Level shifter seems to be main cuase of the issue. Using Intergalaktik PMOD board (using different level shifter) it works fine.