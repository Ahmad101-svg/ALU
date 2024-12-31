LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU3 is -- ALU unit includes Reg. 3
    port (
        clk, res : in std_logic;
        Reg1, Reg2 : in std_logic_vector(7 downto 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
        opcode : in std_logic_vector(15 downto 0); -- 8-bit opcode from Decoder
        studentidin : in std_logic_vector(3 downto 0);
        R1 : out std_logic_vector(3 downto 0)
    );
end ALU3;

architecture calculation of ALU3 is
begin
    process (clk, res)
    begin
        if res = '1' then
            R1 <= "----";  
        elsif (clk'EVENT AND clk = '1') then
            if opcode /= "0000000000000000" then
                case opcode is
                    when "0000000000000001" =>
                        if studentidin(0) = '0' then
                            R1 <= "0000";
                        else
                            R1 <= "1111";
                        end if;
                    when "0000000000000010" =>
                        if studentidin(0) = '0' then
                            R1 <= "0000";
                        else
                            R1 <= "1111";
                        end if;
                    when "0000000000000100" =>
                        if studentidin(0) = '0' then
                            R1 <= "0000";
                        else
                            R1 <= "1111";
                        end if;
                    when "0000000000001000" =>
                        if studentidin(0) = '0' then
                            R1 <= "0000";
                        else
                            R1 <= "1111";
                        end if;
                    when "0000000000010000" =>
                        if studentidin(0) = '0' then
                            R1 <= "0000";
                        else
                            R1 <= "1111";
                        end if;
                    when "0000000000100000" =>
                        if studentidin(0) = '0' then
                            R1 <= "0000";
                        else
                            R1 <= "1111";
                        end if;
                    when "0000000001000000" =>
                        if studentidin(0) = '0' then
                            R1 <= "0000";
                        else
                            R1 <= "1111";
                        end if;
                    when "0000000010000000" =>
                        if studentidin(0) = '0' then
                            R1 <= "0000";
                        else
                            R1 <= "1111";
                        end if;
                    when "0000000100000000" =>
                        if studentidin(0) = '0' then
                            R1 <= "0000";
                        else
                            R1 <= "1111";
                        end if;
                    when others =>
                        R1 <= "----"; -- Don't care, do nothing
                end case;
            end if;
        end if;
    end process;
end calculation;
