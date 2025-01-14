library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Testbench entity
entity tb_Hybrid2 is
end tb_Hybrid2;

architecture behavior of tb_Hybrid2 is

    -- Component declaration of the Hybrid2 unit under test
    component Hybrid2 is
        Port (clk : in std_logic;
              enable : in STD_LOGIC;
              output : out STD_LOGIC);
    end component;

    -- Signals for the testbench
    signal clk : std_logic := '0';
    signal enable : std_logic := '0';
    signal output : std_logic;

begin

    -- Instantiate the unit under test (UUT)
    uut: Hybrid2
        Port map (
            clk => clk,
            enable => enable,
            output => output
        );

    -- Clock process to generate clock signal
    clk_process :process
    begin
        clk <= '0';
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
    end process;

    -- Stimulus process to apply test vectors
    stim_proc: process
    begin
        -- Initial values
        enable <= '0';
        wait for 5 ns;

        -- Test Case 1: Enable signal set to '1'
        enable <= '1';
        wait for 5 ns;

        -- Test Case 2: Disable the enable signal (set to '0')
        enable <= '0';
        wait for 5 ns;

        -- Test Case 3: Enable signal set to '1' again
        enable <= '1';
        wait for 5 ns;

        -- Test Case 4: Test edge cases by toggling enable signal rapidly
        enable <= '0';
        wait for 5 ns;
        enable <= '1';
        wait for 5 ns;
        enable <= '0';
        wait for 5 ns;

        -- Finish the simulation
        wait;
    end process;

end behavior;
