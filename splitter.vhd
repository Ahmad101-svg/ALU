library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity splitter is
    Port (
        input_8bit : in std_logic_vector(7 downto 0); -- 8-bit input
        upper_4bit : out std_logic_vector(3 downto 0); -- Upper 4 bits
        lower_4bit : out std_logic_vector(3 downto 0)  -- Lower 4 bits
    );
end splitter;

architecture behavior of splitter is
begin
    -- Assign the upper 4 bits (input_8bit[7:4]) to upper_4bit
    upper_4bit <= input_8bit(7 downto 4);

    -- Assign the lower 4 bits (input_8bit[3:0]) to lower_4bit
    lower_4bit <= input_8bit(3 downto 0);

end behavior;