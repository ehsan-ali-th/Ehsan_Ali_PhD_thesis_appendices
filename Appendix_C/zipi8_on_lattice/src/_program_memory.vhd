library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library ice;
use ice.all;
entity program_memory  is  

port (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
  );
end program_memory;  

architecture Behavioral of program_memory is
component SB_RAM2048x2 is
	generic ( 
       INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
       ) ;
      port( 
          RDATA : out std_logic_vector( 1  downto 0) ;
          RCLK  : in  std_logic ;
          RCLKE : in  std_logic := 'H';
          RE    : in  std_logic := 'L';
          RADDR : in  std_logic_vector( 10  downto 0) ;
          WCLK  : in  std_logic ;
          WCLKE : in  std_logic := 'H';
          WE    : in  std_logic := 'L';
          WADDR : in  std_logic_vector( 10  downto 0) ;
          WDATA : in  std_logic_vector( 1  downto 0)
         );
end component;
--signal WE : std_logic;
begin 
--WE <= wea(0);
Ram2048x2_inst0 : SB_RAM2048x2
generic map (
INIT_0 => X"150014D3640549CF305F1E63B2441041C224B5C4E4E4E493939390E963030300",
INIT_1 => X"00B270B890444402350E1ECE1EAA000E1ECE1EAA003322334400210141471432",
INIT_2 => X"9384CE4E4E4E4C3939033920000082010C4C2CFC8E284C5864704C5864700341",
INIT_3 => X"039E04939393938F84700000CE4E4E4E133939393933939393840C8000339393",
INIT_4 => X"A00003FFF000003A368C3F8DE23C104E4E4510000810002C10C057118E124C00",
INIT_5 => X"0300000090514209B00AFAE4E47793924E4B939113938939306C6C8C000B3FF8",
INIT_6 => X"93970D08888888BFFFF939F340E4F93A3440D0888B7210139393B34C8A4888B4",
INIT_7 => X"E0000FFFCC93930000FFFC8DCCCCFFFFF939F0D0CCCDFFFF939734988889FFFF",
INIT_8 => X"9303900020C43310C043110C843310C0F7FCD7CD1C1C510E44C1C000221204E4",
INIT_9 => X"0006C6C0C000021C0020C002000A4E41A18184E4C281010E4EA01EF8A0C4C000",
INIT_A => X"939139300013934E4E4E49000000204E4E4E439395000B54E4E04E4E4E44E4C0",
INIT_B => X"4300DFF10E4E40CC130003410048323CE3C124002253938002393A4E400024E4",
INIT_C => X"000000000000000000000000000000000000000014000810CC43010C443210CC",
INIT_D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_F => X"0000000000000000000000000000000000000000000000000000000000000000"
)
port map (
RDATA => douta(1 downto 0),
RADDR => addra(10 downto 0),
RCLK => clka,
RCLKE => ena,
RE => '1',
WADDR => addra(10 downto 0),
WCLK=> clka,
WCLKE => ena,
WDATA => dina(1 downto 0)
--WE => WE
);
Ram2048x2_inst1 : SB_RAM2048x2
generic map (
INIT_0 => X"022425F145800702347CD6CC0CD459460B2EE3FFAA5500FEA95403AEC0A00255",
INIT_1 => X"1030003000400E01308626E40EFF08840EE626FF0AAAA8AA8200AB0000000A13",
INIT_2 => X"5420C55005500C154000B120000CB121CC0796908A6C44444444505050501004",
INIT_3 => X"01C505A15403FEA108FC8008C5500FFAAB15403FEAB154015400064002315401",
INIT_4 => X"300003FFF000001F0FCC84C33004B0FAA5C322AAAF0AAAB4824022048F968400",
INIT_5 => X"030000000033810C101AA85500FFFEABFAA154003EA9403FE00154CC0007111C",
INIT_6 => X"54030C1898AEEEFFFFD5403303AA7FE938CC96EEEF822203FD5423000AAEEEF2",
INIT_7 => X"50000FFFC403FE0000FFFCC88888AFFFFFEAF0E8888BFFFFFEA33A89898BFFFD",
INIT_8 => X"F303C00012CCA1B282CA2B282CA2B185BD54CFCFCC0CCF0A0CC0CAAAB3330FAA",
INIT_9 => X"000015402000010C0016C001000550003E8280FF80F5053AA53F3ABDB0C0EAAA",
INIT_A => X"5403EA90003EA9FAA5500400000014FAA5500EA940AAAF37AA50FAA55000FF80",
INIT_B => X"C615F5500550002C03338B90440B3210A0C16800120EA96AABEA955000001500",
INIT_C => X"00000000000000000000000000000000000000001000043286CA0B28ACA0B28A",
INIT_D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_F => X"0000000000000000000000000000000000000000000000000000000000000000"
)
port map (
RDATA => douta(3 downto 2),
RADDR => addra(10 downto 0),
RCLK => clka,
RCLKE => ena,
RE => '1',
WADDR => addra(10 downto 0),
WCLK=> clka,
WCLKE => '0',
WDATA => dina(3 downto 2)
--WE => WE
);
Ram2048x2_inst2 : SB_RAM2048x2
generic map (
INIT_0 => X"01302A8AE8AAAC50AEAAA40310D1410540BC323555555500000003FBA2020000",
INIT_1 => X"403400310090080030F5D435D00050F4CC37FC004CDDCFDD4308CC1060C00023",
INIT_2 => X"0000C55550000C55550A7E28000DB502D22F2C7DDFB0D4D4D4D4D4D4D4D40000",
INIT_3 => X"E640EA515554000B80740100C555500003155540003155540002044040315554",
INIT_4 => X"20000BFFF83939262984298A61246AAAAA82B80003000008E3381304FA6970E4",
INIT_5 => X"03000000C32A8E04802FFE0000880000000800002AAA8A95515556800002C888",
INIT_6 => X"0007FC1CDCC0002FFF0000FF02AA800200DCE80003222029540010054D400031",
INIT_7 => X"A0002FFFE8A9550002FFFE4CCECDCFFF00003FC0CCCEFFF0000FF0CDEDDCFFF0",
INIT_8 => X"0E2E80000BD526189872510945241890B403C338CB0B0C2FD3B0B00000898AAA",
INIT_9 => X"001555729300000000080000000000022D497A5540BA2AEAAA2D2FFEC3838000",
INIT_A => X"00000004E4C00055555550000000085555555AAAA000022EAAA05555555A5540",
INIT_B => X"5242D0081555429C20B72356564348B1F0FA9400010AAA8000AAA80004E4D555",
INIT_C => X"0000000000000000000000000000000000000000200002509852618947251090",
INIT_D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_F => X"0000000000000000000000000000000000000000000000000000000000000000"
)
port map (
RDATA => douta(5 downto 4),
RADDR => addra(10 downto 0),
RCLK => clka,
RCLKE => ena,
RE => '1',
WADDR => addra(10 downto 0),
WCLK=> clka,
WCLKE => '0',
WDATA => dina(5 downto 4)
--WE => WE
);
Ram2048x2_inst3 : SB_RAM2048x2
generic map (
INIT_0 => X"04100551550001551455541556ECB2CA428C8335555555555555540003030200",
INIT_1 => X"40040C1108E02C8330573C173C00605738162800455454548108442050020821",
INIT_2 => X"0000C00000000C0000203D600008A1558C4604100034C0C0C0C0C0C0C0C00010",
INIT_3 => X"AA8000000000000FE2DE2AA0C00000000300000000300000002208AAA8300000",
INIT_4 => X"880001FFFE7FEAA81E061B27C9860C00000000000000000800400000000020FF",
INIT_5 => X"83800020C333DF8CC00C00000000000000000000000000000000022000000CC0",
INIT_6 => X"0009F4222100001FFF00005D0000000000020000010808000000000020000010",
INIT_7 => X"000007FFF8000000007FFF8000003FFF0000DF402012FFF00009D0020202FFF0",
INIT_8 => X"2020400009EC193064C193464D1934647C014B02000082B00B00000000000000",
INIT_9 => X"0000003B03000000000C000000015553EC0830003BB020C000EEA0F8D0000000",
INIT_A => X"5555555FAA555555555554000000045555555000000000200000555555500000",
INIT_B => X"D190F0040000080C372231F3CCDA331C00C0000000000000000001555FAA5555",
INIT_C => X"0000000000000000000000000000000000000000000002B064C193064C193464",
INIT_D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_F => X"0000000000000000000000000000000000000000000000000000000000000000"
)
port map (
RDATA => douta(7 downto 6),
RADDR => addra(10 downto 0),
RCLK => clka,
RCLKE => ena,
RE => '1',
WADDR => addra(10 downto 0),
WCLK=> clka,
WCLKE => '0',
WDATA => dina(7 downto 6)
--WE => WE
);
Ram2048x2_inst4 : SB_RAM2048x2
generic map (
INIT_0 => X"994A5555555555555555554110010410B4010C90000000000000000000181800",
INIT_1 => X"54A678AD98027140011CC3C44155D01CC3C44155C1111111381C110EE00432B0",
INIT_2 => X"6C6BC1B1B1B1BC4000167599111659956655F7D659EC363636363636363615A5",
INIT_3 => X"E68A4B106C6C6C665B76DA11C1B1B1B1AF06C6C6C6F06C6C6C6BC45684706C6C",
INIT_4 => X"8393939392F939282E082B0BC208009B1B92A06C6E41B1B92493A04807EC68E4",
INIT_5 => X"32F3939082628A09843A66DB1B0B6C6DB1B06C6C06C6C1B1B1E4E5BD11110880",
INIT_6 => X"6C6FAEF030044471B186C6FBB06C46C6A8CC2EEEEF833F06C46C6A8CC2EEEEF8",
INIT_7 => X"BE4E4E4E481B1BE4E4E4E480000036C6DB1BFAEC00036C6DB1BFBB0303031B18",
INIT_8 => X"C1411E4E44A8886221888622188862211800E3AC044400FB304441B1BCC0C1B1",
INIT_9 => X"B113939FB0444440E4E00E4E393AC6C113BB91B1884EEE46C6108937B05046C6",
INIT_A => X"C6C46C693931B11B1B1B164E4E4E461B1B1B11B19E1B191C6C6B1B1B1B11B1B1",
INIT_B => X"888660021000059CD9995659665599559112C4E4E1B1B186C61B186C693906C6",
INIT_C => X"0000000000000000000000000000000000000000279391A22188862218886221",
INIT_D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_F => X"0000000000000000000000000000000000000000000000000000000000000000"
)
port map (
RDATA => douta(9 downto 8),
RADDR => addra(10 downto 0),
RCLK => clka,
RCLKE => ena,
RE => '1',
WADDR => addra(10 downto 0),
WCLK=> clka,
WCLKE => '0',
WDATA => dina(9 downto 8)
--WE => WE
);
Ram2048x2_inst5 : SB_RAM2048x2
generic map (
INIT_0 => X"55455555555555555555554110020820A1004450000000000000000000949400",
INIT_1 => X"54555455542952802A1441444155581441444155411111112818110550041150",
INIT_2 => X"0155C00550055C0000003002AAA0000000000000000015151515151515151455",
INIT_3 => X"000000000154015125126AAAC005500557001540157001540155622AAAB00154",
INIT_4 => X"29540154005540000000000000002A2AFF000AABFC0AAFF00000050143C00055",
INIT_5 => X"00515408200000022801556AFF850156AFF801542ABFC00552550296AAAA911A",
INIT_6 => X"01515540002AAA80054015155001401554001555554005001401554001555554",
INIT_7 => X"FFFAAFFAA00055550055000000000ABFEAFF15540000ABFEAFF1550000000054",
INIT_8 => X"5AAA655009A2998A662998A662998A6662AA66A9AAAA69FF54AAA0055DD14AAF",
INIT_9 => X"AF09540FF800000A5506A5509540156157FFD005515FFF401555107402AA8015",
INIT_A => X"6ABC0155401AAF0055AAF7FAA550070055AAF0055F00551C015F0055AAF0055A",
INIT_B => X"29998AAA0000000CD000FF51444001040000025501F005401500540155400015",
INIT_C => X"00000000000000000000000000000000000000001954028A662998A662998A66",
INIT_D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_F => X"0000000000000000000000000000000000000000000000000000000000000000"
)
port map (
RDATA => douta(11 downto 10),
RADDR => addra(10 downto 0),
RCLK => clka,
RCLKE => ena,
RE => '1',
WADDR => addra(10 downto 0),
WCLK=> clka,
WCLKE => '0',
WDATA => dina(11 downto 10)
--WE => WE
);
Ram2048x2_inst6 : SB_RAM2048x2
generic map (
INIT_0 => X"D56555555555555555555569980104105020245FFFFFFFFFFFFFFFFFF45454AA",
INIT_1 => X"1571557455876116550669C66900250669C6690011111111B451116D57D65956",
INIT_2 => X"FFDF5FFFFFFFF5FFFF7BDA640009A666999A79E99F0135353535353535355655",
INIT_3 => X"A03A8FF7FFFFFFDB9DB9E8FF5FFFFFFF7D7FFFFFFFD7FFFFFFCCD99A3FD7FFFF",
INIT_4 => X"B7FFF7FFFE6AAA0360D9E0D83679FCFFFFB7640002D000016DA367D9FFFFCBAA",
INIT_5 => X"6677FFC596669A5985C3FFFFFFFFFFFFFFFFFFFF7FFFDFFFF7FFFCCC0003C00D",
INIT_6 => X"FFFB7FEDEDC0002FFF7FFFB7F7FFFFFF3D99FC0003F6677FFFFFF3D99FC0003F",
INIT_7 => X"FFFFDFFFF1FFFFFFFDFFFF1DDDDDEFFF7FFFB7FDDDDEFFF7FFFB7FDEDEDEFFF7",
INIT_8 => X"2FCF90000240624189062418906241899000DB7EDFDF9E6F98FDF00006665FFF",
INIT_9 => X"557FFFCEF30000DC0009C0000003FFF483F3CFFFE60FCF3FFF826F9007F7C000",
INIT_A => X"FFFFFFFAAA3FFFFFFFFFF900000009FFFFFFFFFFE5000267FFF5FFFFFFFFFFD5",
INIT_B => X"062640017FFFDEF56666EDA6999A6669F763FC00065FFFC000FFFFFFFAAABFFF",
INIT_C => X"0000000000000000000000000000000000000000640000018906241890624189",
INIT_D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_F => X"0000000000000000000000000000000000000000000000000000000000000000"
)
port map (
RDATA => douta(13 downto 12),
RADDR => addra(10 downto 0),
RCLK => clka,
RCLKE => ena,
RE => '1',
WADDR => addra(10 downto 0),
WCLK=> clka,
WCLKE => '0',
WDATA => dina(13 downto 12)
--WE => WE
);
Ram2048x2_inst7 : SB_RAM2048x2
generic map (
INIT_0 => X"A0DE000000000000000000073000000000001C0FFFFFFFFFFFFFFFFFF0000000",
INIT_1 => X"71C7F5C9F5B0301438000B000B5521000B000B55100000000035005A06982785",
INIT_2 => X"AA9A1FFFFAAAA1FFFF0281DD55571DCC7730E3873A012020202020202020718C",
INIT_3 => X"FC16FAA7FFFEAA907907900A1FFFFAAA687FFFEAAA87FFFEAA9980340287FFFE",
INIT_4 => X"3000015554C0000300C380C030E3B1BFFF6B0D5554A555502F281E07BFAA8DFF",
INIT_5 => X"01E4000000DC31D09143EBFFFFFAFFFEAAAAAAA96AAA9AAAA7FFFD915556800C",
INIT_6 => X"AAA7C28D8D95555FFFEAAA7CA7FFEAAB4807BD5554B01E7FFEAAB4807BD5554B",
INIT_7 => X"F000055551FFFF000055551D9D9D8FFFEAAA7C29D9D9FFFEAAA7CAD8D8D8FFFE",
INIT_8 => X"4FAA655550C000C003000C003000C003315403E8CF0A78CA31F0A555500CDFFF",
INIT_9 => X"007FFFD1A4555501555315555556AAA403EA8AAA9C0FAA2AAA01DA3007C29555",
INIT_A => X"AAABFFF0002AAAFFFFFFF655555553AAAAAAAFFFC05555CEAAA0FFFFFFFAAA80",
INIT_B => X"000CC5507FFFC1A11DDCC81C7731DCC3A682A955540FFFD555AAABFFF0002AAA",
INIT_C => X"00000000000000000000000000000000000000005955540003000C003000C003",
INIT_D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_F => X"0000000000000000000000000000000000000000000000000000000000000000"
)
port map (
RDATA => douta(15 downto 14),
RADDR => addra(10 downto 0),
RCLK => clka,
RCLKE => ena,
RE => '1',
WADDR => addra(10 downto 0),
WCLK=> clka,
WCLKE => '0',
WDATA => dina(15 downto 14)
--WE => WE
);
Ram2048x2_inst8 : SB_RAM2048x2
generic map (
INIT_0 => X"50B0AAAAAAAAAAAAAAAAAAADDEA8A28A0AAAB20AAAAAAAAAAAAAAAAAA20202AA",
INIT_1 => X"2282A280A2D5692AC5866D266D5502866D266D552888888896DA88B50AA2DC0B",
INIT_2 => X"00002AAAA00002AAAA000B31555CB332CCCB0C2CC0AA8080808080808080A348",
INIT_3 => X"56BF500AAAA80008C08C00002AAAA00000AAAA80000AAAA8000008C0000AAAA8",
INIT_4 => X"A15554000315556A2A8C2A8AA30C202AAAD631555755555835D5705C2A002F55",
INIT_5 => X"230955508332CB29D2EA82AAAAA0AAA800000003800020000AAAA80155542AA8",
INIT_6 => X"000D402828155570000000C00AAA8002008C2955542230AAA8002008C2955542",
INIT_7 => X"A55550000AAAAA55550000A8282830000000D40282830000000C008282830000",
INIT_8 => X"6A50D555531867619D867619D867619DC9540C028A50C300C8A5055552332AAA",
INIT_9 => X"00AAAA8000555551555C15555554000AAA94200032AA508000AB30DAAA941555",
INIT_A => X"0002AAA5554000AAAAAAAD5555555D0000000AAAA55557340000AAAAAAA00000",
INIT_B => X"86772550AAAA8002333280B2CCCB332C095401555A1AAA95550002AAA5554000",
INIT_C => X"0000000000000000000000000000000000000000B55554619D867619D867619D",
INIT_D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_F => X"0000000000000000000000000000000000000000000000000000000000000000"
)
port map (
RDATA => douta(17 downto 16),
RADDR => addra(10 downto 0),
RCLK => clka,
RCLKE => ena,
RE => '1',
WADDR => addra(10 downto 0),
WCLK=> clka,
WCLKE => '0',
WDATA => dina(17 downto 16)
--WE => WE
);
end Behavioral;
