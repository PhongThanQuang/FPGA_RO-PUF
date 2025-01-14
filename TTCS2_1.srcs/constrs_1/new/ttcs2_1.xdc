## Clock constraint
set_property PACKAGE_PIN N15 [get_ports clk]        # Ch�n clock (ki?m tra pinout)
set_property IOSTANDARD LVCMOS18 [get_ports clk]   # Chu?n t�n hi?u cho clock
create_clock -period 10.000 [get_ports clk]        # T?o clock v?i chu k? 10ns (100 MHz)

## Enable constraint
set_property PACKAGE_PIN K16 [get_ports enable]    # Ch�n enable (ki?m tra pinout)
set_property IOSTANDARD LVCMOS33 [get_ports enable]

## Output constraint
set_property PACKAGE_PIN J15 [get_ports output]    # Ch�n output (ki?m tra pinout)
set_property IOSTANDARD LVCMOS33 [get_ports output]

## ??t chu?n I/O cho t�n hi?u clk
set_property PACKAGE_PIN N5 [get_ports clk]        # Ch�n clock
set_property IOSTANDARD LVCMOS18 [get_ports clk]   # Chu?n t�n hi?u cho clock

## ??t chu?n I/O cho t�n hi?u enable
set_property PACKAGE_PIN K16 [get_ports enable]    # Ch�n enable
set_property IOSTANDARD LVCMOS33 [get_ports enable]

## ??t chu?n I/O cho t�n hi?u output
set_property PACKAGE_PIN J15 [get_ports output]    # Ch�n output
set_property IOSTANDARD LVCMOS33 [get_ports output]

## V? tr� c?a t�n hi?u clk
set_property PACKAGE_PIN N15 [get_ports clk]        # V? tr� ch�n clock

## V? tr� c?a t�n hi?u enable
set_property PACKAGE_PIN K16 [get_ports enable]    # V? tr� ch�n enable

## V? tr� c?a t�n hi?u output
set_property PACKAGE_PIN J15 [get_ports output]    # V? tr� ch�n output
