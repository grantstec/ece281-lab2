library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is
    -- Component declaration for the Unit Under Test (UUT)
    component sevenseg_decoder
        Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
               o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    -- Input signals
    signal w_Hex : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    
    -- Output signals - vector for connecting to UUT
    signal w_seg_n : STD_LOGIC_VECTOR (6 downto 0);
    
    -- Individual segment signals for easier viewing in waveform
    signal seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g : STD_LOGIC;
    
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: sevenseg_decoder 
        port map ( 
            i_Hex => w_Hex,
            o_seg_n => w_seg_n
        );
    
    -- Map individual segments for easier waveform reading
    -- Note: Based on Basys3 mapping where seg(0) = CA, seg(6) = CG
    seg_a <= w_seg_n(0);  -- CA
    seg_b <= w_seg_n(1);  -- CB
    seg_c <= w_seg_n(2);  -- CC
    seg_d <= w_seg_n(3);  -- CD
    seg_e <= w_seg_n(4);  -- CE
    seg_f <= w_seg_n(5);  -- CF
    seg_g <= w_seg_n(6);  -- CG
        
    -- Stimulus process
    stim_proc: process
    begin
        -- Test all 16 possible inputs (0 to F)
        wait for 20 ns;
        
        -- Test for 0
        w_Hex <= "0000";  -- Hexadecimal 0
        wait for 20 ns;
        
        -- Test for 1
        w_Hex <= "0001";  -- Hexadecimal 1
        wait for 20 ns;
        
        -- Test for 2
        w_Hex <= "0010";  -- Hexadecimal 2
        wait for 20 ns;
        
        -- Test for 3
        w_Hex <= "0011";  -- Hexadecimal 3
        wait for 20 ns;
        
        -- Test for 4
        w_Hex <= "0100";  -- Hexadecimal 4
        wait for 20 ns;
        
        -- Test for 5
        w_Hex <= "0101";  -- Hexadecimal 5
        wait for 20 ns;
        
        -- Test for 6
        w_Hex <= "0110";  -- Hexadecimal 6
        wait for 20 ns;
        
        -- Test for 7
        w_Hex <= "0111";  -- Hexadecimal 7
        wait for 20 ns;
        
        -- Test for 8
        w_Hex <= "1000";  -- Hexadecimal 8
        wait for 20 ns;
        
        -- Test for 9
        w_Hex <= "1001";  -- Hexadecimal 9
        wait for 20 ns;
        
        -- Test for A
        w_Hex <= "1010";  -- Hexadecimal A
        wait for 20 ns;
        
        -- Test for B
        w_Hex <= "1011";  -- Hexadecimal B
        wait for 20 ns;
        
        -- Test for C
        w_Hex <= "1100";  -- Hexadecimal C
        wait for 20 ns;
        
        -- Test for D
        w_Hex <= "1101";  -- Hexadecimal D
        wait for 20 ns;
        
        -- Test for E
        w_Hex <= "1110";  -- Hexadecimal E
        wait for 20 ns;
        
        -- Test for F
        w_Hex <= "1111";  -- Hexadecimal F
        wait for 20 ns;
        
        -- End of test
        report "Test completed successfully";
        wait;  -- Wait indefinitely at the end of simulation
    end process;
end Behavioral;