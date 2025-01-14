library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;
entity Hybrid2 is
Port (clk : in std_logic;
enable : in STD_LOGIC;
output : out STD_LOGIC
);
end Hybrid2;
architecture Behavioral of Hybrid2 is
signal sel : STD_LOGIC;
signal C: STD_LOGIC_vector (5 downto 0);
signal OUT_INT : STD_LOGIC;
signal OUT_INT2 : STD_LOGIC;
signal O1, O2 : STD_LOGIC;
signal Int_O1, Int_O2, Int_O3, Int_O4 : STD_LOGIC;
signal CARRY_BW : STD_LOGIC;
signal CARRY_BW1 : STD_LOGIC;
signal CARRY_BW2 : STD_LOGIC;
signal CARRY_BW3 : STD_LOGIC;
signal CARRY_BW4 : STD_LOGIC;
attribute keep : string;
attribute keep of C : signal is "TRUE";
attribute S: string;
attribute S of C: signal is "TRUE";
attribute rloc: string;
attribute rloc of inst_nand: label is "X-2Y0";
attribute rloc of inst_Inv: label is "X-2Y1";
attribute rloc of inst_Inv2: label is "X-1Y0";
attribute rloc of inst_Inv3: label is "X-1Y1";
attribute rloc of Multiplexer0: label is "X-2Y2";
attribute rloc of inst_Inv4: label is "X-2Y3";
attribute rloc of inst_Inv5: label is "X-1Y2";
attribute rloc of SRL16E_inst: label is "X0Y5";
attribute rloc of Int_SRL16E_inst: label is "X0Y4";
attribute rloc of Int_SRL16E_inst2: label is "X0Y3";
attribute rloc of Int_SRL16E_inst3: label is "X0Y3";
attribute rloc of SRL16E_inst2: label is "X0Y2";
attribute rloc of MUXCY_inst: label is "X0Y5";
attribute rloc of Int_MUXCY_inst: label is "X0Y4";
attribute rloc of Int_MUXCY_inst2: label is "X0Y3";
attribute rloc of Int_MUXCY_inst3: label is "X0Y3";
attribute rloc of MUXCY_inst2: label is "X0Y2";
attribute rloc of FDCPE_inst: label is "X-2Y4";
attribute rloc of FDCPE_inst2: label is "X-2Y1";
begin
inst_nand : LUT2
generic map (
INIT => X"7") -- initialized as a NAND
port map (
O => C(0), -- LUT general output
I0 => enable, -- LUT input
I1 => C(5) -- LUT input
);
inst_Inv : LUT1
generic map (
INIT => "01") -- initialized as a NOT
port map (
O => C(1), -- LUT general output
I0 => C(0) -- LUT input
);
inst_Inv2 : LUT1
generic map (
INIT => "01")
port map (
O => C(2), -- LUT general output
I0 => C(1) -- LUT input
);
inst_Inv3 : LUT1
generic map (
INIT => "01")
port map (
O => C(3), -- LUT general output
I0 => C(2) -- LUT input
);
Multiplexer0 : MUXCY
port map (
O => C(4), -- Carry output signal
CI => C(1), -- Carry input signal
DI => C(3), -- Data input signal
S => sel -- MUX select
);
inst_Inv4 : LUT1
generic map (
INIT => "01")
port map (
O => C(5), -- LUT general output
I0 => C(4) -- LUT input
);
inst_Inv5 : LUT1
generic map (
INIT => "01")
port map (
O => output, -- LUT general output
I0 => C(5) -- LUT input
);
SRL16E_inst : SRL16E -- the "top" shift register instance
generic map (
INIT => X"5555")
port map (
Q => O1, -- SRL data output
A0 => '1', -- Select[0] input
A1 => '1', -- Select[1] input
A2 => '1', -- Select[2] input
A3 => '1', -- Select[3] input
CE => enable, -- Clock enable input
CLK => CLK, -- Clock input
D => O1 -- SRL data input
);
Int_SRL16E_inst : SRL16E -- Intermediate blocks
generic map (
INIT => X"FFFF")
port map (
Q => Int_O1, -- SRL data output
A0 => '1', -- Select[0] input
A1 => '1', -- Select[1] input
A2 => '1', -- Select[2] input
A3 => '1', -- Select[3] input
CE => enable, -- Clock enable input
CLK => CLK, -- Clock input
D => '1' -- SRL data input
);
Int_SRL16E_inst2 : SRL16E
generic map (
INIT => X"FFFF")
port map (
Q => Int_O2, -- SRL data output
A0 => '1', -- Select[0] input
A1 => '1', -- Select[1] input
A2 => '1', -- Select[2] input
A3 => '1', -- Select[3] input
CE => enable, -- Clock enable input
CLK => CLK, -- Clock input
D => '1' -- SRL data input
);
Int_SRL16E_inst3 : SRL16E
generic map (
INIT => X"FFFF")
port map (
Q => Int_O3, -- SRL data output
A0 => '1', -- Select[0] input
A1 => '1', -- Select[1] input
A2 => '1', -- Select[2] input
A3 => '1', -- Select[3] input
CE => enable, -- Clock enable input
CLK => CLK, -- Clock input
D => '1' -- SRL data input
);
SRL16E_inst2 : SRL16E -- the "bottom" shift register instance
generic map (
INIT => X"AAAA")
port map (
Q => O2, -- SRL data output
A0 => '1', -- Select[0] input
A1 => '1', -- Select[1] input
A2 => '1', -- Select[2] input
A3 => '1', -- Select[3] input
CE => enable, -- Clock enable input
CLK => CLK, -- Clock input
D => O2 -- SRL data input
);
MUXCY_inst : MUXCY
port map (
O => OUT_INT, -- Carry output signal
CI => CARRY_BW4, -- Carry input signal
DI => '0', -- Data input signal
S => O1 -- MUX select
);
Int_MUXCY_inst : MUXCY
port map (
O => CARRY_BW4, -- Carry output signal
CI => CARRY_BW3, -- Carry input signal
DI => '0', -- Data input signal
S => Int_O1 -- MUX select
);
Int_MUXCY_inst2 : MUXCY
port map (
O => CARRY_BW3, -- Carry output signal
CI => CARRY_BW2, -- Carry input signal
DI => '0', -- Data input signal
S => Int_O2 -- MUX select
);
Int_MUXCY_inst3 : MUXCY
port map (
O => CARRY_BW2, -- Carry output signal
CI => CARRY_BW, -- Carry input signal
DI => '0', -- Data input signal
S => Int_O3 -- MUX select
);
MUXCY_inst2 : MUXCY
port map (
O => CARRY_BW, -- Carry output signal
CI => '1', -- Carry input signal
DI => '0', -- Data input signal
S => O2 -- MUX select
);
-- This FF captures the glitch
FDCPE_inst : FDCPE
generic map (
INIT => '0') -- Initial value of register
port map (
Q => OUT_INT2, -- Data output
C => CLK, -- Clock input
CE => '0', -- Clock enable input
CLR => '0', -- Asynchronous clear input
D => OUT_INT2, -- Data input
PRE => OUT_INT -- Asynchronous set input
);
FDCPE_inst2 : FDCPE
generic map (
INIT => '0') -- Initial value of register
port map (
Q => sel, -- Data output
C => CLK, -- Clock input
CE => enable, -- Clock enable input
CLR => '0', -- Asynchronous clear input
D => OUT_INT2, -- Data input
PRE => '0' -- Asynchronous set input
);
end Behavioral;