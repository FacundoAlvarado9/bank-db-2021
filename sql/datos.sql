/*

Integrantes:

	Facundo alvarado,	LU: 125404
	Tomás Felipe,		LU: 124441

*/


USE banco;

/*
Insert de ciudades-------------------------------------------------------------------------------------------------------
*/
INSERT INTO ciudad VALUES(8370,"San MArtin de los Andes");
INSERT INTO ciudad VALUES(1000,"Mordor");
INSERT INTO ciudad VALUES(0001,"Bahia Blanca");
INSERT INTO ciudad VALUES(1789,"Springfield");
INSERT INTO ciudad VALUES(1313,"Chicago");
INSERT INTO ciudad VALUES(8000,"New New York");
INSERT INTO ciudad VALUES(4000,"Roma");
INSERT INTO ciudad VALUES(1234,"Boston");
INSERT INTO ciudad VALUES(1001,"Paris");
INSERT INTO ciudad VALUES(1002,"Las ovejas");
INSERT INTO ciudad VALUES(1003,"Coober Pedy");
INSERT INTO ciudad VALUES(1004,"Chess City");
INSERT INTO ciudad VALUES(1005,"Auroville");
INSERT INTO ciudad VALUES(1006,"An Najaf");
INSERT INTO ciudad VALUES(1007,"Yakutsk");
INSERT INTO ciudad VALUES(1008,"Al Aziziya");
INSERT INTO ciudad VALUES(1009,"Dacca");
INSERT INTO ciudad VALUES(1010,"Rapture");
INSERT INTO ciudad VALUES(9999,"Jackson");
INSERT INTO ciudad VALUES(5000,"Atlantic");

/*
Insert de sucursales-------------------------------------------------------------------------------------------------------
*/
INSERT INTO sucursal VALUES(NULL,"Eleven","Rivadavia 200","29823423","08 Am - 12 Am",1789);
INSERT INTO sucursal VALUES(NULL,"Mark I","Argentina 300","2932432","11:59 Am - 12 Am",4000);
INSERT INTO sucursal VALUES(NULL,"Number One","Mapache 400","298322423","10 Am - 12 Am",1234);
INSERT INTO sucursal VALUES(NULL,"All Star","Icela creyo 500","2952373","07 Am - 12 Am",1000);
INSERT INTO sucursal VALUES(NULL,"MVP","Oscar 600","2986756","04 Am - 12 Am",1001);
INSERT INTO sucursal VALUES(NULL,"Mark II","Sihabia 700","295765","08 Am - 13 Am",1002);
INSERT INTO sucursal VALUES(NULL,"Mark III","Lugaren 800","295676","08 Am - 14 Am",1003);
INSERT INTO sucursal VALUES(NULL,"1 de Enero","Latabla 900","2565423","08 Am - 16 Am",1004);
INSERT INTO sucursal VALUES(NULL,"Neo","Rose 1000","29886546","08 Am - 15 Am",1005);
INSERT INTO sucursal VALUES(NULL,"Nero","Lakers 223","29864654","01 Am - 11 Pm",1006);
INSERT INTO sucursal VALUES(NULL,"Hot Springs","calle 300","2985465","08 Am - 12 Am",1007);
INSERT INTO sucursal VALUES(NULL,"Ripper","direccion 500","29546546","08 Am - 10 Am",1008);
INSERT INTO sucursal VALUES(NULL,"Copeland","Allem 200","2546546","08 Am - 9 Am",1009);
INSERT INTO sucursal VALUES(NULL,"Iron Mike","Panama 900","54656654","08 Am - 2 pm",1010);
INSERT INTO sucursal VALUES(NULL,"Diamond Lake","Daslavia 8900","4564565","08 Am - 2 Am",8000);
INSERT INTO sucursal VALUES(NULL,"Wizard Island","york 6240","25775453","0 Am - 1 Am",4000);
INSERT INTO sucursal VALUES(NULL,"Cold Iceland","T800 200","456456455","08 Am - 12 Am",1003);
INSERT INTO sucursal VALUES(NULL,"WLF","kaja 324","2754645","09 Am - 11 Am",1000);
INSERT INTO sucursal VALUES(NULL,"Seraphites","LJ 030","2546456","02 Am - 12 Am",1789);
INSERT INTO sucursal VALUES(NULL,"Libertalia","RW 3467","298646545","01 Am - 9 Pm",1008);


/*
Insert de empleados-------------------------------------------------------------------------------------------------------
*/
INSERT INTO empleado VALUES(NULL,"Jones","Indiana","DNI",98726738,"calle 1-1","296757657","Atencion al cliente",md5("1"),001);
INSERT INTO empleado VALUES(NULL,"Jones","Indiana","DNI",98726738,"calle 1-1","296757657","Atencion al cliente",md5("pwdEmp1101"),001);
INSERT INTO empleado VALUES(NULL,"Jones","David","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp02"),003);
INSERT INTO empleado VALUES(NULL,"Simpson","Rufy","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp03"),001);
INSERT INTO empleado VALUES(NULL,"Stimpson","Robbin","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp04"),002);
INSERT INTO empleado VALUES(NULL,"Fry","Ell","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp05"),003);
INSERT INTO empleado VALUES(NULL,"Rocket","Lia","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp06"),004);
INSERT INTO empleado VALUES(NULL,"Anderson","Mod","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp07"),005);
INSERT INTO empleado VALUES(NULL,"Galactico","SinNombre","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp08"),006);
INSERT INTO empleado VALUES(NULL,"Espacial","Brian","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp09"),006);
INSERT INTO empleado VALUES(NULL,"Transversal","O J","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp10"),006);
INSERT INTO empleado VALUES(NULL,"Dud","JJJ","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp11"),007);
INSERT INTO empleado VALUES(NULL,"Brown","Apu","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp12"),008);
INSERT INTO empleado VALUES(NULL,"Rack","Tod","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp13"),009);
INSERT INTO empleado VALUES(NULL,"Williams","Ned","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp14"),010);
INSERT INTO empleado VALUES(NULL,"First","Pater","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp15"),011);
INSERT INTO empleado VALUES(NULL,"Winner","Peter","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp16"),012);
INSERT INTO empleado VALUES(NULL,"Lusser","Piter","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp17"),013);
INSERT INTO empleado VALUES(NULL,"Loser","Pet","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp18"),014);
INSERT INTO empleado VALUES(NULL,"Simpson","Ted","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp19"),015);
INSERT INTO empleado VALUES(NULL,"Stimpson","Barny","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp20"),016);
INSERT INTO empleado VALUES(NULL,"Fry","Rock","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp21"),017);
INSERT INTO empleado VALUES(NULL,"Rocket","Jack","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp22"),018);
INSERT INTO empleado VALUES(NULL,"Anderson","Lisa","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp23"),019);
INSERT INTO empleado VALUES(NULL,"Espacial","Bart","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp24"),019);
INSERT INTO empleado VALUES(NULL,"Williams","Maggie","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp25"),019);
INSERT INTO empleado VALUES(NULL,"Williams","Amy","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp26"),019);
INSERT INTO empleado VALUES(NULL,"Dud","Camaron","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp27"),005);
INSERT INTO empleado VALUES(NULL,"Jones","Hubber","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp28"),008);
INSERT INTO empleado VALUES(NULL,"Rocket","Bender","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp29"),006);
INSERT INTO empleado VALUES(NULL,"Dud","Lila","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp30"),011);
INSERT INTO empleado VALUES(NULL,"Anderson","Homer","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp31"),012);
INSERT INTO empleado VALUES(NULL,"Espacial","Marge","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp32"),012);
INSERT INTO empleado VALUES(NULL,"Galactico","Helen","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp33"),013);
INSERT INTO empleado VALUES(NULL,"Dud","Anonima 3","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp34"),014);
INSERT INTO empleado VALUES(NULL,"Galactico","Anonima I","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp35"),015);
INSERT INTO empleado VALUES(NULL,"Jones","Anonimo II","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp36"),019);
INSERT INTO empleado VALUES(NULL,"Jones","Anonimo","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp37"),017);
INSERT INTO empleado VALUES(NULL,"Anderson","Laura","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp38"),018);
INSERT INTO empleado VALUES(NULL,"Lusser","James","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp39"),019);
INSERT INTO empleado VALUES(NULL,"Winner","Rachael","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp40"),001);
INSERT INTO empleado VALUES(NULL,"Jones","Jessie","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp41"),002);
INSERT INTO empleado VALUES(NULL,"Dud","Dud","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp42"),003);
INSERT INTO empleado VALUES(NULL,"Rocket","Mary","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp43"),004);
INSERT INTO empleado VALUES(NULL,"Espacial","Jack","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp44"),005);
INSERT INTO empleado VALUES(NULL,"Rocket","Russel","DNI",58756738,"calle 1-2","294323657","Atencion al cliente",md5("pwdEmp45"),006);


/*
Insert de clientes-------------------------------------------------------------------------------------------------------
*/
INSERT INTO cliente VALUES(NULL,"Apellido1","Nombre1","DNI",98726738,"calle 1-1","296757657",str_to_date('15/11/1942', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Apellido2","Nombre2","DNI",98723438,"calle 1-2","296723657","1990/05/18");
INSERT INTO cliente VALUES(NULL,"Apellido3","Nombre3","DNI",98723438,"calle 1-2","296723657","1990/05/18");
INSERT INTO cliente VALUES(NULL,"Kaatje","Gollum","DNI",00000001,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Kacey","Aarón","DNI",00000002,"calle 1-2","324324324","991/06/20");
INSERT INTO cliente VALUES(NULL,"Kachina","Aaronit","DNI",00000003,"calle 1-2","324324324","1991/06/22");
INSERT INTO cliente VALUES(NULL,"Kadeem","Aba","DNI",00000004,"calle 1-2","324324324","1991/06/23");
INSERT INTO cliente VALUES(NULL,"Kado","Abaco","DNI",00000005,"calle 1-2","324324324","1991/06/24");
INSERT INTO cliente VALUES(NULL,"Kaede","Abalen","DNI",00000006,"calle 1-2","324324324","1991/06/25");
INSERT INTO cliente VALUES(NULL,"Kaikson","Abbas","DNI",00000007,"calle 1-2","324324324","1991/06/26");
INSERT INTO cliente VALUES(NULL,"Kaira","Abbie","DNI",00000008,"calle 1-2","324324324","1991/06/27");
INSERT INTO cliente VALUES(NULL,"Kalena","Abbott","DNI",00000009,"calle 1-2","324324324","1991/06/28");
INSERT INTO cliente VALUES(NULL,"Lael","Abby","DNI",00000091,"calle 1-2","324324324","1991/06/29");
INSERT INTO cliente VALUES(NULL,"Lacie","Abdala","DNI",00000081,"calle 1-2","324324324","1991/01/20");
INSERT INTO cliente VALUES(NULL,"Laird","Abdas","DNI",00000071,"calle 1-2","324324324","1991/02/20");
INSERT INTO cliente VALUES(NULL,"Ladislao","Abdecalas","DNI",00000061,"calle 1-2","324324324","1991/03/20");
INSERT INTO cliente VALUES(NULL,"Laertes","Abdel","DNI",00000051,"calle 1-2","324324324","1991/04/20");
INSERT INTO cliente VALUES(NULL,"Labib","Abderico","DNI",00000041,"calle 1-2","324324324","1991/05/20");
INSERT INTO cliente VALUES(NULL,"Laercio","Abdias","DNI",00000031,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Laksmi","Abdiel","DNI",00000021,"calle 1-2","324324324","1991/07/20");
INSERT INTO cliente VALUES(NULL,"Lain","Abdieso","DNI",00000011,"calle 1-2","324324324","1991/08/20");
INSERT INTO cliente VALUES(NULL,"Ladd","Abdo","DNI",00000101,"calle 1-2","324324324","1991/09/20");
INSERT INTO cliente VALUES(NULL,"Lana","Abdon","DNI",00000201,"calle 1-2","324324324","1991/10/20");
INSERT INTO cliente VALUES(NULL,"Lance","Abdul","DNI",00000301,"calle 1-2","324324324","1991/11/20");
INSERT INTO cliente VALUES(NULL,"Laron","Abdullah","DNI",00000401,"calle 1-2","324324324","1991/12/20");
INSERT INTO cliente VALUES(NULL,"Lauriana","Abe","DNI",00000501,"calle 1-2","324324324","1992/06/20");
INSERT INTO cliente VALUES(NULL,"Laureana","Abel","DNI",00000601,"calle 1-2","324324324","1993/06/20");
INSERT INTO cliente VALUES(NULL,"Laraine","Abelardo","DNI",00000701,"calle 1-2","324324324","1994/06/20");
INSERT INTO cliente VALUES(NULL,"Lastenia","Abelina","DNI",00000801,"calle 1-2","324324324","1995/06/20");
INSERT INTO cliente VALUES(NULL,"Nadin","Abelino","DNI",00000901,"calle 1-2","324324324","1996/06/20");
INSERT INTO cliente VALUES(NULL,"Nadin","Abenamar","DNI",00008001,"calle 1-2","324324324","1997/06/20");
INSERT INTO cliente VALUES(NULL,"Larrimore","Abenamor","DNI",00009001,"calle 1-2","324324324","1998/06/20");
INSERT INTO cliente VALUES(NULL,"Nahum","Abencio","DNI",00007001,"calle 1-2","324324324","1999/06/20");
INSERT INTO cliente VALUES(NULL,"Nahieli","Acira","DNI",00006001,"calle 1-2","324324324","2000/06/20");
INSERT INTO cliente VALUES(NULL,"Nalbert","Acisclo","DNI",00005001,"calle 1-2","324324324","2001/06/20");
INSERT INTO cliente VALUES(NULL,"Naaman","Ackerley","DNI",00004001,"calle 1-2","324324324","2002/06/20");
INSERT INTO cliente VALUES(NULL,"Lastenia","Acnin","DNI",00003001,"calle 1-2","324324324","2003/06/20");
INSERT INTO cliente VALUES(NULL,"Najibe","Acucio","DNI",00002001,"calle 1-2","324324324","1989/06/20");
INSERT INTO cliente VALUES(NULL,"Nacha","Acursio","DNI",00001001,"calle 1-2","324324324","1990/06/20");
INSERT INTO cliente VALUES(NULL,"Nanine","Ada","DNI",00010001,"calle 1-2","324324324","1981/06/20");
INSERT INTO cliente VALUES(NULL,"Lastenia","Adabella","DNI",00020001,"calle 1-2","324324324","1991/01/01");
INSERT INTO cliente VALUES(NULL,"Nascha","Adah","DNI",00030001,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Nasif","Adaia","DNI",00040001,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Nathanel","Adair","DNI",00050001,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Nathanel","Adala","DNI",00060001,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Nasim","Adalberto","DNI",00070001,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Nastassia","Adalgisa","DNI",00080001,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Nataly","Adalguisa","DNI",00090001,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Narella","Adalia","DNI",00800001,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Nayli Mical","Adalía","DNI",00600001,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Narlu","Adalid","DNI",00700001,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Odaia","Adalino","DNI",00500001,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Odelia","Adalis","DNI",00400001,"calle 1-2","324324324","1993/07/20");
INSERT INTO cliente VALUES(NULL,"Oberon","Adaluz","DNI",00300001,"calle 1-2","324324324","1992/06/21");
INSERT INTO cliente VALUES(NULL,"Odila","Jenifer","DNI",00200001,"calle 1-2","324324324","1992/06/20");
INSERT INTO cliente VALUES(NULL,"Octavia","Jenna","DNI",00100001,"calle 1-2","324324324","1991/06/01");
INSERT INTO cliente VALUES(NULL,"Oceano","Jennie","DNI",01000001,"calle 1-2","324324324","1991/06/02");
INSERT INTO cliente VALUES(NULL,"Pambon","Jennifer","DNI",02000001,"calle 1-2","324324324","1991/06/03");
INSERT INTO cliente VALUES(NULL,"Palmiera","Jeziel","DNI",43000001,"calle 1-2","324324324","1991/06/04");
INSERT INTO cliente VALUES(NULL,"Paciano","Jibril","DNI",04000001,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Patrick","Jilian Kiu","DNI",05000001,"calle 1-2","324324324","1991/06/05");
INSERT INTO cliente VALUES(NULL,"Paola","Josemir","DNI",06000001,"calle 1-2","324324324","1991/06/06");
INSERT INTO cliente VALUES(NULL,"Perseveranda","Joseph","DNI",07000001,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Pilmayquen","Josephine","DNI",08000001,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Shelton","Juno","DNI",09000001,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Sigifredo","Junior","DNI",05060701,"calle 1-2","324324324","1991/06/20");
INSERT INTO cliente VALUES(NULL,"Lael","Abby","Pasaporte",00000091,"calle 1-2","324324324","1991/06/29");
INSERT INTO cliente VALUES(NULL,"Lacie","Abdala","Pasaporte",00000081,"calle 1-2","324324324","1991/01/20");
INSERT INTO cliente VALUES(NULL,"Laird","Abdas","Visa_t",00000071,"calle 1-2","324324324","1991/02/20");

/*
Insert de plazos fijos-------------------------------------------------------------------------------------------------------
*/
INSERT INTO plazo_fijo VALUES(NULL,10000.20,"2010/01/01","2020/01/01",10.25,10.25,001);
INSERT INTO plazo_fijo VALUES(NULL,120000.21,"2010/02/01","2020/08/02",19.25,10.25,002);
INSERT INTO plazo_fijo VALUES(NULL,130000.22,"2010/03/01","2020/10/03",15.25,10.25,003);
INSERT INTO plazo_fijo VALUES(NULL,140000.78,"2010/04/01","2020/11/04",10.25,10.25,004);
INSERT INTO plazo_fijo VALUES(NULL,150000.90,"2010/05/01","2020/12/05",45.25,10.25,005);
INSERT INTO plazo_fijo VALUES(NULL,160000.00,"2010/06/01","2020/02/06",10.55,10.25,006);
INSERT INTO plazo_fijo VALUES(NULL,170000.00,"2010/07/01","2020/02/07",15.25,10.25,007);
INSERT INTO plazo_fijo VALUES(NULL,180000.00,"2010/08/01","2020/03/08",54.25,10.25,008);
INSERT INTO plazo_fijo VALUES(NULL,190000.00,"2010/09/01","2020/04/09",13.25,10.25,009);
INSERT INTO plazo_fijo VALUES(NULL,1990000.00,"2010/10/01","2020/05/09",65.25,10.25,010);
INSERT INTO plazo_fijo VALUES(NULL,1880000.00,"2010/11/01","2020/06/08",16.25,10.25,011);
INSERT INTO plazo_fijo VALUES(NULL,1770000.00,"2010/12/01","2040/07/07",04.25,10.25,012);
INSERT INTO plazo_fijo VALUES(NULL,1660000.00,"2010/12/01","2039/08/06",16.25,10.25,012);
INSERT INTO plazo_fijo VALUES(NULL,1550000.34,"2011/01/01","2039/09/07",05.25,10.25,013);
INSERT INTO plazo_fijo VALUES(NULL,1440000.14,"2012/02/01","2037/01/05",10.25,10.25,014);
INSERT INTO plazo_fijo VALUES(NULL,1330000.24,"2013/01/01","2036/01/04",13.25,10.25,015);
INSERT INTO plazo_fijo VALUES(NULL,1220000.52,"2014/01/01","2035/01/03",1.25,10.25,016);
INSERT INTO plazo_fijo VALUES(NULL,1110000.75,"2015/01/01","2034/01/02",1.35,10.25,017);
INSERT INTO plazo_fijo VALUES(NULL,1340000.37,"2016/01/01","2033/01/01",1.25,10.25,018);
INSERT INTO plazo_fijo VALUES(NULL,1560000.53,"2017/01/01","2031/01/10",10.25,10.25,019);
INSERT INTO plazo_fijo VALUES(NULL,1640000.63,"2018/01/01","2031/01/01",14.25,10.25,001);
INSERT INTO plazo_fijo VALUES(NULL,1560000.83,"2019/01/01","2030/01/02",10.25,10.25,002);
INSERT INTO plazo_fijo VALUES(NULL,15450000.93,"2020/01/01","2029/01/01",12.25,10.25,003);
INSERT INTO plazo_fijo VALUES(NULL,14540000.03,"2001/01/01","2028/01/01",0.25,10.25,003);
INSERT INTO plazo_fijo VALUES(NULL,1450000.01,"2002/01/01","2027/01/21",10.25,10.25,003);
INSERT INTO plazo_fijo VALUES(NULL,904500.33,"2003/01/01","2026/01/11",0.25,10.25,005);
INSERT INTO plazo_fijo VALUES(NULL,1987.53,"2004/01/01","2025/01/11",10.25,10.25,004);
INSERT INTO plazo_fijo VALUES(NULL,105465.45,"2005/01/01","2024/01/21",10.25,10.25,005);
INSERT INTO plazo_fijo VALUES(NULL,10564.98,"2006/01/01","2023/01/21",1.25,10.25,007);
INSERT INTO plazo_fijo VALUES(NULL,10456.99,"2007/01/01","2032/01/21",10.25,10.25,008);
INSERT INTO plazo_fijo VALUES(NULL,100890.89,"2008/01/01","2021/01/11",10.25,10.25,010);
INSERT INTO plazo_fijo VALUES(NULL,14540000.03,"2001/01/01","2028/01/01",1.25,10.25,003);
INSERT INTO plazo_fijo VALUES(NULL,1450000.01,"2002/01/01","2027/01/21",10.35,10.25,003);
INSERT INTO plazo_fijo VALUES(NULL,904500.33,"2003/01/01","2026/01/11",10.25,10.25,005);
INSERT INTO plazo_fijo VALUES(NULL,1987.53,"2004/01/01","2025/01/11",13.25,10.25,004);
INSERT INTO plazo_fijo VALUES(NULL,180000.00,"2010/08/01","2020/03/08",45.25,10.25,008);
INSERT INTO plazo_fijo VALUES(NULL,190000.00,"2010/09/01","2020/04/09",13.25,10.25,009);
INSERT INTO plazo_fijo VALUES(NULL,1990000.00,"2010/10/01","2020/05/09",15.25,10.25,010);
INSERT INTO plazo_fijo VALUES(NULL,1880000.00,"2010/11/01","2020/06/08",15.25,10.25,011);


/*
Insert de Tazas plazos fijos-------------------------------------------------------------------------------------------------------
*/
INSERT INTO tasa_plazo_fijo VALUES(001,100.00,1000.00,51.00);
INSERT INTO tasa_plazo_fijo VALUES(002,10.00 ,1000.00,52.00);
INSERT INTO tasa_plazo_fijo VALUES(003,10.25 ,1000.00,53.00);
INSERT INTO tasa_plazo_fijo VALUES(004,109.00,1000.10,54.00);
INSERT INTO tasa_plazo_fijo VALUES(005,110.00,1000.20,55.00);
INSERT INTO tasa_plazo_fijo VALUES(006,120.00,1000.30,56.00);
INSERT INTO tasa_plazo_fijo VALUES(007,130.00,1000.40,57.00);
INSERT INTO tasa_plazo_fijo VALUES(008,140.12,1000.50,58.00);
INSERT INTO tasa_plazo_fijo VALUES(009,150.00,1000.60,59.00);
INSERT INTO tasa_plazo_fijo VALUES(010,160.10,1000.70,60.00);
INSERT INTO tasa_plazo_fijo VALUES(011,170.05,1000.80,70.00);
INSERT INTO tasa_plazo_fijo VALUES(021,180.00,1000.90,80.10);
INSERT INTO tasa_plazo_fijo VALUES(031,190.00,1009.10,90.09);
INSERT INTO tasa_plazo_fijo VALUES(041,120.00,1008.00,40.08);
INSERT INTO tasa_plazo_fijo VALUES(051,123.14,1007.00,20.07);
INSERT INTO tasa_plazo_fijo VALUES(061,109.09,1006.00,20.06);
INSERT INTO tasa_plazo_fijo VALUES(071,100.00,1005.00,10.05);
INSERT INTO tasa_plazo_fijo VALUES(081,100.00,1004.00,50.04);
INSERT INTO tasa_plazo_fijo VALUES(091,105.00,1003.00,50.03);
INSERT INTO tasa_plazo_fijo VALUES(171,102.00,1002.00,50.02);
INSERT INTO tasa_plazo_fijo VALUES(991,103.00,1001.00,50.01);

/*
Insert de plazos clientes-------------------------------------------------------------------------------------------------------
*/
INSERT INTO plazo_cliente VALUES(00000001,00001);
INSERT INTO plazo_cliente VALUES(00000002,00066);
INSERT INTO plazo_cliente VALUES(00000003,00065);
INSERT INTO plazo_cliente VALUES(00000004,00064);
INSERT INTO plazo_cliente VALUES(00000005,00063);
INSERT INTO plazo_cliente VALUES(00000006,00062);
INSERT INTO plazo_cliente VALUES(00000007,00061);
INSERT INTO plazo_cliente VALUES(00000008,00060);
INSERT INTO plazo_cliente VALUES(00000009,00059);
INSERT INTO plazo_cliente VALUES(00000010,00058);
INSERT INTO plazo_cliente VALUES(00000011,00057);
INSERT INTO plazo_cliente VALUES(00000012,00056);
INSERT INTO plazo_cliente VALUES(00000013,00055);
INSERT INTO plazo_cliente VALUES(00000014,00054);
INSERT INTO plazo_cliente VALUES(00000015,00053);
INSERT INTO plazo_cliente VALUES(00000016,00052);
INSERT INTO plazo_cliente VALUES(00000017,00051);
INSERT INTO plazo_cliente VALUES(00000018,00050);
INSERT INTO plazo_cliente VALUES(00000019,00049);
INSERT INTO plazo_cliente VALUES(00000020,00048);
INSERT INTO plazo_cliente VALUES(00000021,00047);
INSERT INTO plazo_cliente VALUES(00000022,00046);
INSERT INTO plazo_cliente VALUES(00000023,00045);
INSERT INTO plazo_cliente VALUES(00000024,00044);
INSERT INTO plazo_cliente VALUES(00000025,00043);
INSERT INTO plazo_cliente VALUES(00000026,00042);
INSERT INTO plazo_cliente VALUES(00000027,00041);
INSERT INTO plazo_cliente VALUES(00000028,00040);
INSERT INTO plazo_cliente VALUES(00000029,00039);
INSERT INTO plazo_cliente VALUES(00000030,00038);
INSERT INTO plazo_cliente VALUES(00000031,00037);
INSERT INTO plazo_cliente VALUES(00000032,00036);
INSERT INTO plazo_cliente VALUES(00000033,00035);
INSERT INTO plazo_cliente VALUES(00000034,00034);
INSERT INTO plazo_cliente VALUES(00000035,00033);
INSERT INTO plazo_cliente VALUES(00000036,00032);
INSERT INTO plazo_cliente VALUES(00000037,00031);
INSERT INTO plazo_cliente VALUES(00000038,00030);
INSERT INTO plazo_cliente VALUES(00000039,00029);
INSERT INTO plazo_cliente VALUES(00000023,00028);
INSERT INTO plazo_cliente VALUES(00000011,00027);
INSERT INTO plazo_cliente VALUES(00000012,00026);
INSERT INTO plazo_cliente VALUES(00000013,00025);
INSERT INTO plazo_cliente VALUES(00000014,00024);
INSERT INTO plazo_cliente VALUES(00000015,00023);
INSERT INTO plazo_cliente VALUES(00000016,00022);
INSERT INTO plazo_cliente VALUES(00000017,00021);
INSERT INTO plazo_cliente VALUES(00000018,00020);
INSERT INTO plazo_cliente VALUES(00000019,00019);
INSERT INTO plazo_cliente VALUES(00000020,00018);
INSERT INTO plazo_cliente VALUES(00000021,00017);
INSERT INTO plazo_cliente VALUES(00000022,00016);
INSERT INTO plazo_cliente VALUES(00000023,00015);
INSERT INTO plazo_cliente VALUES(00000024,00014);
INSERT INTO plazo_cliente VALUES(00000025,00013);
INSERT INTO plazo_cliente VALUES(00000026,00012);
INSERT INTO plazo_cliente VALUES(00000002,00011);
INSERT INTO plazo_cliente VALUES(00000003,00010);
INSERT INTO plazo_cliente VALUES(00000004,00009);
INSERT INTO plazo_cliente VALUES(00000005,00008);
INSERT INTO plazo_cliente VALUES(00000006,00007);
INSERT INTO plazo_cliente VALUES(00000007,00006);
INSERT INTO plazo_cliente VALUES(00000008,00005);
INSERT INTO plazo_cliente VALUES(00000009,00004);
INSERT INTO plazo_cliente VALUES(00000010,00003);
INSERT INTO plazo_cliente VALUES(00000011,00002);


/*
Insert de plazos clientes-------------------------------------------------------------------------------------------------------
*/
INSERT INTO prestamo VALUES(NULL,"2011/11/01",04,100.05,65.25,10.25,10.25,0021,00042);
INSERT INTO prestamo VALUES(NULL,"2019/11/01",02,100.05,10.25,10.25,10.25,0024,00041);
INSERT INTO prestamo VALUES(NULL,"2021/11/01",02,100.05,98.25,10.25,10.25,0030,00040);
INSERT INTO prestamo VALUES(NULL,"2020/11/01",02,100.05,23.25,10.25,10.25,0031,00039);
INSERT INTO prestamo VALUES(NULL,"2014/11/01",02,100.05,10.25,10.25,10.25,0032,00038);
INSERT INTO prestamo VALUES(NULL,"2014/11/01",02,100.05,4.25,10.25,10.25,0033,00037);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,40.25,10.25,10.25,0034,00036);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,50.25,10.25,10.25,0038,00035);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,12.25,10.25,10.25,0039,00034);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",03,100.05,89.25,10.25,10.25,0040,00033);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,23.25,10.25,10.25,0045,00032);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",01,100.05,12.25,10.25,10.25,0045,00031);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",04,100.05,10.25,10.25,10.25,0045,00030);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,19.25,10.25,10.25,0041,00029);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",04,100.05,18.25,10.25,10.25,0041,00028);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,10.25,10.25,10.25,0042,00027);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",04,100.05,34.25,10.25,10.25,0043,00026);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,10.25,10.25,10.25,0044,00025);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",04,100.05,24.25,10.25,10.25,0010,00024);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,10.25,10.25,10.25,0011,00023);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",04,100.05,82.25,10.25,10.25,0012,00022);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,10.25,10.25,10.25,0013,00021);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,34.25,10.25,10.25,0014,00020);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,8.25,10.25,10.25,0020,00019);
INSERT INTO prestamo VALUES(NULL,"2018/11/01",02,100.05,2.25,10.25,10.25,0003,00018);
INSERT INTO prestamo VALUES(NULL,"2017/11/01",02,100.05,10.25,10.25,10.25,0003,00017);
INSERT INTO prestamo VALUES(NULL,"2016/11/01",02,100.05,5.25,10.25,10.25,0003,00016);
INSERT INTO prestamo VALUES(NULL,"2015/11/01",02,100.05,10.25,10.25,10.25,0005,00015);
INSERT INTO prestamo VALUES(NULL,"2014/11/01",02,100.05,10.25,10.25,10.25,0006,00014);
INSERT INTO prestamo VALUES(NULL,"2013/11/01",02,100.05,10.25,10.25,10.25,0003,00013);
INSERT INTO prestamo VALUES(NULL,"2012/11/01",03,100.05,10.25,10.25,10.25,0003,00012);
INSERT INTO prestamo VALUES(NULL,"2011/11/01",04,100.05,10.25,10.25,10.25,0033,00011);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,10.25,10.25,10.25,0017,00010);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",01,100.05,10.25,10.25,10.25,0003,00009);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",01,100.05,3.25,10.25,10.25,0023,00008);
INSERT INTO prestamo VALUES(NULL,"2019/11/01",05,100.05,2.25,10.25,10.25,0023,00007);
INSERT INTO prestamo VALUES(NULL,"2011/11/01",06,100.05,7.25,10.25,10.25,0023,00006);
INSERT INTO prestamo VALUES(NULL,"2012/11/01",02,100.05,54.25,10.25,10.25,0032,00005);
INSERT INTO prestamo VALUES(NULL,"2017/11/01",06,100.05,10.25,10.25,10.25,0021,00004);
INSERT INTO prestamo VALUES(NULL,"2018/11/01",05,100.05,12.25,10.25,10.25,0043,00003);
INSERT INTO prestamo VALUES(NULL,"2019/11/01",04,100.05,11.25,10.25,10.25,0043,00002);
INSERT INTO prestamo VALUES(NULL,"2020/11/01",03,100.05,19.25,10.25,10.25,0043,00001);

UPDATE pago SET fecha_pago="2012/11/01" WHERE nro_prestamo=1 AND nro_pago=1;

/*
Insert de tasa_prestamo-------------------------------------------------------------------------------------------------------
*/
INSERT INTO tasa_prestamo VALUES(001,1.00,2000.25,01.00);
INSERT INTO tasa_prestamo VALUES(002,1000,4000.25,52.00);
INSERT INTO tasa_prestamo VALUES(003,2000,6000.25,35.00);
INSERT INTO tasa_prestamo VALUES(004,4000,8000.25,42.00);
INSERT INTO tasa_prestamo VALUES(005,5000,10000.25,5.30);
INSERT INTO tasa_prestamo VALUES(006,6000,12000.25,7.26);

/*
Insert de caja_ahorro-------------------------------------------------------------------------------------------------------
*/
INSERT INTO caja_ahorro VALUES(1,1,100.99);
INSERT INTO caja_ahorro VALUES(2,11,200.99);
INSERT INTO caja_ahorro VALUES(3,12,1.00);
INSERT INTO caja_ahorro VALUES(4,13,0.29);
INSERT INTO caja_ahorro VALUES(5,14,50000.95);
INSERT INTO caja_ahorro VALUES(6,15,10034.99);
INSERT INTO caja_ahorro VALUES(7,16,10043.99);
INSERT INTO caja_ahorro VALUES(8,17,199.99);
INSERT INTO caja_ahorro VALUES(9,18,900.99);
INSERT INTO caja_ahorro VALUES(10,19,400.99);
INSERT INTO caja_ahorro VALUES(11,111,6700.99);
INSERT INTO caja_ahorro VALUES(12,112,2100.99);
INSERT INTO caja_ahorro VALUES(13,113,6500.99);
INSERT INTO caja_ahorro VALUES(14,114,99985.99);


/*
Insert de cliente_ca-------------------------------------------------------------------------------------------------------
*/
INSERT INTO cliente_ca VALUES(1,14);
INSERT INTO cliente_ca VALUES(2,13);
INSERT INTO cliente_ca VALUES(10,12);
INSERT INTO cliente_ca VALUES(11,11);
INSERT INTO cliente_ca VALUES(3,10);
INSERT INTO cliente_ca VALUES(4,09);
INSERT INTO cliente_ca VALUES(6,08);
INSERT INTO cliente_ca VALUES(5,07);
INSERT INTO cliente_ca VALUES(10,06);
INSERT INTO cliente_ca VALUES(7,05);
INSERT INTO cliente_ca VALUES(8,04);
INSERT INTO cliente_ca VALUES(9,03);
INSERT INTO cliente_ca VALUES(12,02);
INSERT INTO cliente_ca VALUES(15,01);

/*
Insert de tarjeta-------------------------------------------------------------------------------------------------------
*/
INSERT INTO tarjeta VALUES(1,MD5(1),MD5(216),"2023/01/09",1,14);
INSERT INTO tarjeta VALUES(101,MD5(1),MD5(216),"2023/01/09",1,14);
INSERT INTO tarjeta VALUES(102,MD5(2),MD5(215),"2023/01/09",2,13);
INSERT INTO tarjeta VALUES(103,MD5(3),MD5(214),"2023/01/09",10,12);
INSERT INTO tarjeta VALUES(104,MD5(4),MD5(213),"2023/01/09",11,11);
INSERT INTO tarjeta VALUES(105,MD5(5),MD5(212),"2023/01/09",3,10);
INSERT INTO tarjeta VALUES(106,MD5(6),MD5(29),"2023/01/09",4,09);
INSERT INTO tarjeta VALUES(107,MD5(7),MD5(28),"2023/01/09",6,08);
INSERT INTO tarjeta VALUES(108,MD5(8),MD5(27),"2023/01/09",5,07);
INSERT INTO tarjeta VALUES(109,MD5(9),MD5(26),"2023/01/09",10,06);
INSERT INTO tarjeta VALUES(110,MD5(10),MD5(25),"2023/01/09",7,05);
INSERT INTO tarjeta VALUES(120,MD5(11),MD5(24),"2023/01/09",7,05);
INSERT INTO tarjeta VALUES(130,MD5(12),MD5(23),"2023/01/09",8,04);
INSERT INTO tarjeta VALUES(140,MD5(13),MD5(22),"2023/01/09",9,03);
INSERT INTO tarjeta VALUES(150,MD5(14),MD5(21),"2023/01/09",12,02);
INSERT INTO tarjeta VALUES(160,MD5(15),MD5(20),"2023/01/09",15,01);


/*
Insert de tarjeta-------------------------------------------------------------------------------------------------------
*/
INSERT INTO caja VALUES(1);
INSERT INTO caja VALUES(2);
INSERT INTO caja VALUES(3);
INSERT INTO caja VALUES(4);
INSERT INTO caja VALUES(5);
INSERT INTO caja VALUES(6);
INSERT INTO caja VALUES(7);
INSERT INTO caja VALUES(8);
INSERT INTO caja VALUES(9);
INSERT INTO caja VALUES(10);

#Para el ATM de la GUI
INSERT INTO caja VALUES(100);


/*
Insert de ventanillas-------------------------------------------------------------------------------------------------------
*/
INSERT INTO ventanilla VALUES(1,12);
INSERT INTO ventanilla VALUES(2,11);
INSERT INTO ventanilla VALUES(3,10);
INSERT INTO ventanilla VALUES(4,10);
INSERT INTO ventanilla VALUES(5,1);
INSERT INTO ventanilla VALUES(6,2);
INSERT INTO ventanilla VALUES(7,3);
INSERT INTO ventanilla VALUES(8,4);
INSERT INTO ventanilla VALUES(9,5);
INSERT INTO ventanilla VALUES(10,6);

/*
Insert de ATMs-------------------------------------------------------------------------------------------------------
*/
INSERT INTO atm(cod_caja,cod_postal,direccion)
	SELECT cod_caja,cod_postal,direccion FROM ventanilla NATURAL JOIN sucursal;

#Para el ATM de la GUI
INSERT INTO atm(cod_caja, cod_postal, direccion) VALUES(100, 1000, "Calle Falsa 123");

/*
Insert de Transaccion-------------------------------------------------------------------------------------------------------
*/
INSERT INTO transaccion VALUES(NULL,"2018/01/09","12:05:06",100.00);
INSERT INTO transaccion VALUES(NULL,"2019/02/09","12:00:06",100.00);
INSERT INTO transaccion VALUES(NULL,"2010/03/09","13:05:06",100.00);
INSERT INTO transaccion VALUES(NULL,"2011/04/09","12:05:06",100.00);
INSERT INTO transaccion VALUES(NULL,"2012/05/09","12:05:06",100.00);
INSERT INTO transaccion VALUES(NULL,"2013/06/09","17:05:02",100.00);
INSERT INTO transaccion VALUES(NULL,"2014/07/09","12:05:04",100.00);
INSERT INTO transaccion VALUES(NULL,"2015/08/09","12:05:06",100.00);
INSERT INTO transaccion VALUES(NULL,"2016/09/09","12:05:01",100.00);
INSERT INTO transaccion VALUES(NULL,"2016/10/09","12:00:00",100.00);
INSERT INTO transaccion VALUES(NULL,"2014/10/09","12:00:00",190.00);

/*
Insert de Debito-------------------------------------------------------------------------------------------------------
*/
INSERT INTO debito VALUES(1,"descripcion1...",1,14);
INSERT INTO debito VALUES(2,"descripcion2...",2,13);
INSERT INTO debito VALUES(3,"descripcion3...",10,12);
INSERT INTO debito VALUES(4,"descripcion4...",11,11);
INSERT INTO debito VALUES(5,"descripcion5...",3,10);
INSERT INTO debito VALUES(6,"descripcion6...",4,09);
INSERT INTO debito VALUES(7,"descripcion7...",6,08);
INSERT INTO debito VALUES(8,"descripcion8...",5,07);
INSERT INTO debito VALUES(9,"descripcion9...",10,06);
INSERT INTO debito VALUES(10,"descripcion10...",7,05);

/*
Transaccion por caja-------------------------------------------------------------------------------------------------------
*/
INSERT INTO transaccion_por_caja VALUES(1,5);
INSERT INTO transaccion_por_caja VALUES(2,6);
INSERT INTO transaccion_por_caja VALUES(3,7);
INSERT INTO transaccion_por_caja VALUES(4,8);
INSERT INTO transaccion_por_caja VALUES(5,9);
INSERT INTO transaccion_por_caja VALUES(6,5);
INSERT INTO transaccion_por_caja VALUES(7,6);
INSERT INTO transaccion_por_caja VALUES(8,7);
INSERT INTO transaccion_por_caja VALUES(9,8);
INSERT INTO transaccion_por_caja VALUES(10,9);
INSERT INTO transaccion_por_caja VALUES(11,9);

INSERT INTO deposito VALUES(1,11);
INSERT INTO deposito VALUES(2,12);
INSERT INTO deposito VALUES(3,13);
INSERT INTO deposito VALUES(4,11);

INSERT INTO extraccion VALUES(5,10,06);
INSERT INTO extraccion VALUES(6,15,01);
INSERT INTO extraccion VALUES(7,1,14);
INSERT INTO extraccion VALUES(8,3,10);

INSERT INTO transferencia VALUES(9,8,04,14);
INSERT INTO transferencia VALUES(10,9,03,13);

