----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.04.2023 03:44:46
-- Design Name: 
-- Module Name: evm - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_Logic_ARITH.ALL;
use IEEE.STD_logic_UNSIGNED.ALL;

entity evm is
 Port ( clk : in STD_LOGIC; 
clr : in STD_LOGIC;
cls : in STD_LOGIC;
count: in STD_LOGIC_VECTOR(3 downto 0);
max1,max2,max3: inout STD_LOGIC_VECTOR(9 downto 0);
d1,d2,d3,d4,d5,d6: out STD_LOGIC_VECTOR(6 downto 0);
n:in STD_LOGIC_VECTOR(2 downto 0);
cd1,cd2,cd3,cd4,cd5,cd6,cd7,cd8,cd9,cd10,cd11,cd12,cd13,cd14,cd15: inout STD_LOGIC_VECTOR (9 downto 0)); 
end evm;
architecture Behavioral of evm is
begin 
process(clk,clr,count,n,cls,cd1,cd2,cd3,cd4,cd5,cd6,cd7,cd8,cd9,cd10,cd11,cd12,cd13,cd14,cd15,max1,max2,max3) 
begin
if(clk='1' and clk'event) then
if (clr='1') then cd1<="0000000000"; cd2<="0000000000"; cd3<="0000000000";
cd4<="0000000000"; cd5<="0000000000"; cd6<="0000000000";
cd7<="0000000000"; cd8<="0000000000"; cd10<="0000000000"; cd11<="0000000000"; cd12<="0000000000";
cd13<="0000000000"; cd15<="0000000000"; 
max1 <="0000000000" ; 
max2<="0000000000"; max3<="0000000000";
d1 <="0000000"; d2 <= "0000000"; d3<="0000000" ; d4<="0000000"; d5<="0000000"; d6<:"0000000";
end if;
if(cls='0')then 
 if( n="01") then
 if (count="0001") then 
 cd1 <=cdl + 1; 
 elsif (count="0010") then
 cd2<=cd2+ 1;
 elsif (count="0011") then 
 cd3<=cd3+1; 
elsif (count="0100") then 
cd4<=cd4+1;
elsif (count="0101") then
cd5<=cd5+1;
end if;
elsif(n="10") then
if (count="0101") then
cd6<=cd6+1;
elsif(count="0111") then
cd7<=cd7+1;
elsif (count="1000") then
cd8<=cd8+1;
elsif (count="1001")then
cd9<=cd9+1;
elsif (count="1010")then 
cd10<=cd10+1;
 end if;
elsif (n="11") then
if (count="1011") then 
cd11<=cd11+1;
elsif (count="1100" ) then 
cd12<=cd12+1;
elsif (count="1101") then
cd14<=cd14+1;
elsif(count="1111") then
cd15<=cd15+ 1;
end if;
end if;
end if;
if(n="01")then
max1=cd1; 
d1<="0000000"; 
d2<="011000"; 
if (max1=cd2)then
d1<="1001111";
d2<="1001111";
elsif(max1<=cd2)then
max1<=cd2; 
d1<="0000000";
d2<="1101101";
elsif (max1=cd4)then
d1<="1001111";
d2<="1001111";
elsif(max1<=cd4)then
max1<=cd4;
d1<="0000000";
d2<="0110011";
elsif (max1=cd5)then
d1<="1001111";
d2<="1001111";
elsif{max1<=cd5;
d1<="0000000";
d2<="0000000";
 end if;
end if;
if(n="10") then
max2<= d6;
d3<="0000000"; 
d4<="1011111";
 if(max2=cd7)then 
 d3<="1001111";
d4<="1001111";
elsif(max2=cd7) then 
max2<=cd7;
d3<="0000000";
d4<="1110000";
elsif(max2=cd8)then
d3<="1001111";
d4<="1001111";
elsif (max2=cd8) then
d3<="0000000";
d4<="1111111";
elsif(max2=cd9)then
d3<="1001111"; 
d4<="1001111";
max2<=cd9;
d3<="0000000";
d4<="1111011";
elsif (max2=cd10)then
d3<="1001111";
d4<="1001111";
elsif(max2<cd10)then
max2<=cd10; 
d3<="0110000";
d4<="0000000";
end if;
--end if;
if( n="11") then
 max3<=cd11 ; 
d5<="0110000";
d6<="0110000";
if(max3=cd12)then 
d5<="1001111";
d6<="1001111";
elsif(max3<cd12)then
max3<=cd12;
d5<="0110000"; 
d6<="1101101";
elsif(max3=cd13)then
d5<="1001111";
d6<="1001111";
elsif(max3<cd13)then
max3<=cd13;
d5<="0110000"; 
d6<="1111001";
elsif(max3<="1001111")
d6<="1001111"; 
elsif(max3<cd14)then
max3<=cd14;
d5<="0110000";
d6<="0110011";
elsif(max3=cd15)then
d5<="1001111";
d6<="1001111";
elsif(max3<cd15)then
max3<=cd15;
d5<="0110000";
d6<="1011011";
end if;
end if;
end if;
end process;
end behavioral;
