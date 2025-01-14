## Clock constraint
set_property PACKAGE_PIN N15 [get_ports clk]        # Chân clock (ki?m tra pinout)
set_property IOSTANDARD LVCMOS18 [get_ports clk]   # Chu?n tín hi?u cho clock
create_clock -period 10.000 [get_ports clk]        # T?o clock v?i chu k? 10ns (100 MHz)

## Enable constraint
set_property PACKAGE_PIN K16 [get_ports enable]    # Chân enable (ki?m tra pinout)
set_property IOSTANDARD LVCMOS33 [get_ports enable]

## Output constraint
set_property PACKAGE_PIN J15 [get_ports output]    # Chân output (ki?m tra pinout)
set_property IOSTANDARD LVCMOS33 [get_ports output]

## ??t chu?n I/O cho tín hi?u clk
set_property PACKAGE_PIN N5 [get_ports clk]        # Chân clock
set_property IOSTANDARD LVCMOS18 [get_ports clk]   # Chu?n tín hi?u cho clock

## ??t chu?n I/O cho tín hi?u enable
set_property PACKAGE_PIN K16 [get_ports enable]    # Chân enable
set_property IOSTANDARD LVCMOS33 [get_ports enable]

## ??t chu?n I/O cho tín hi?u output
set_property PACKAGE_PIN J15 [get_ports output]    # Chân output
set_property IOSTANDARD LVCMOS33 [get_ports output]

## V? trí c?a tín hi?u clk
set_property PACKAGE_PIN N15 [get_ports clk]        # V? trí chân clock

## V? trí c?a tín hi?u enable
set_property PACKAGE_PIN K16 [get_ports enable]    # V? trí chân enable

## V? trí c?a tín hi?u output
set_property PACKAGE_PIN J15 [get_ports output]    # V? trí chân output
