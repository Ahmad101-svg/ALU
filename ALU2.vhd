LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;
entity ALU2 is -- ALU unit includes Reg. 3
port ( clk, res : in std_logic ;
Reg1, Reg2 : in std_logic_vector(7 downto 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
opcode : in std_logic_vector(15 downto 0); -- 8-bit opcode from Decoder
R1, R2  : out std_logic_vector(3 downto 0); -- 8-bit Result
        sign, sign2     : out std_logic  -- Neg flag, single bit output
    );
end ALU2 ;
architecture calculation of ALU2 is
SIGNAL Result :STD_LOGIC_vector(7 downto 0);
begin
process ( clk, res )
begin
        if res = '1' then
            Result <= "00000000";
        elsif (clk'EVENT AND clk = '1') then
            case opcode is
					 when "0000000000000010" =>
					 Result<= reg1+2;
                when "0000000000000100" =>
					 Result(7)<='0';
					 Result(6)<='0';
					 Result(5 downto 0)<= reg2(5 downto 0);                
					 when "0000000000001000" =>
					 Result(7)<='1';
					 Result(6)<='1';
					 Result(5)<='1';
					 Result(4)<='1';
					 Result(3 downto 0)<= reg1(3 downto 0);                
					 when "0000000000010000" =>
                    	if reg1 < reg2 then
							Result <= reg1;
							else
							Result <= reg2;
							end if;		
					when "0000000000100000" =>
                Result(7)<=reg1(1);
					 Result(6)<=reg1(0);
					 Result(5)<=reg1(5);
					 Result(4)<=reg1(4);
					 Result(3)<=reg1(3);
					 Result(2)<=reg1(2);
					 Result(1)<=reg1(7);
					 Result(0)<=reg1(6);
					when "0000000001000000" =>
                Result(7)<=reg2(0);
					 Result(6)<=reg2(1);
					 Result(5)<=reg2(2);
					 Result(4)<=reg2(3);
					 Result(3)<=reg2(4);
					 Result(2)<=reg2(5);
					 Result(1)<=reg2(6);
					 Result(0)<=reg2(7);
					when "0000000010000000" =>
					 Result<=(reg1 xor reg2);               
					when "0000000100000000" => 
					 Result<= (reg1 + reg2)-4;
                when others =>
					 Result <="--------"; 
 end case;
        end if;
    end process;
	 	R1<= Result(3 downto 0);
				R2<=Result(7 downto 4);
				Sign2<=Result(7);
end calculation;