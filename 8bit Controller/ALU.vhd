----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2023 23:20:09
-- Design Name: 
-- Module Name: ALU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


-- Submodule ALU 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;  
 use IEEE.STD_LOGIC_1164.ALL;  
 USE ieee.std_logic_arith.all;  
 USE ieee.std_logic_unsigned.all; 
 
 entity ALU is  
 port (  

                A,B: in std_logic_vector(7 downto 0);  
                ALU_Sel:in std_logic_vector(2 downto 0);   
                NZVC: out std_logic_vector(3 downto 0);  
                Result: out std_logic_vector(7 downto 0)  
           );  
 end ALU;  
 architecture Behavioral of ALU is  
 signal ALU_Result:std_logic_vector(7 downto 0);  
 signal ALU_ADD: std_logic_vector(8 downto 0);  
 signal C,Z,V,N,add_ov,sub_ov: std_logic;  
 begin  
 process(ALU_Sel,A,B)  
 begin  

           ALU_ADD <= "000000000";  
      case(ALU_Sel) is  
           when "000" => -- ADD  
                ALU_ADD <= ('0' & A )+ ('0'& B);  
                ALU_Result <= A + B;  
           when "001" => -- SUB  
                ALU_Result <= B - A;       
                ALU_ADD      <= ('0' & B) - ('0' & A);       
           when "010" => -- AND  
                ALU_Result <= A and B;  
           when "011" => -- OR  
                ALU_Result <= A or B;            
           when "100" => -- Increment  
                ALU_Result <= A + x"01";                 
           when "101" => -- Decrement  
                ALU_Result <= A - x"01";       
           when others =>  
                ALU_Result <= A + B;  
      end case;  
 end process;  
      Result <= ALU_Result;  
      N <= ALU_Result(7);  
      Z <= '1' when ALU_Result = x"00" else  
            '0'; 
 
 ---Overflow flag---------------------------------------  
   add_ov<= (A(7)and B(7)    and (not ALU_Result(7))) or ((not A(7))and (not B(7)) and ALU_Result(7));  
   sub_ov<= (A(7)and (not B(7)) and (not ALU_Result(7))) or ((not A(7))and B(7)    and ALU_Result(7));   
   with ALU_Sel select  
    V    <= add_ov when "000",  
          sub_ov when "001",  
          '0' when others;  
      -- Carry out flag  
   with ALU_Sel select  
    C <=  ALU_ADD(8) when "000",  
        ALU_ADD(8) when "001",  
          '0' when others;  
      NZVC <= N & Z & V & C;  
 end Behavioral;  
