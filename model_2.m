function p = model_2(x)

v =[-1.44023596878514,-2.05280803169301,0.374259299054549,0.291806670554470,0.654840637881318,-0.657341122668475,0.652509474897550,-0.442791687805722;
    -1.79388446492732,1.08918071875480,-0.0182682753508133,0.141085692420610,0.388575794997459,-0.252572108213267,0.235397122723312,-0.148464764876146];
w =[-0.641203928598711,-0.679658655995395,0.941853013713945,1.13664640340118,0.274670236906925,0.412391559338975,-0.509727191199682,0.685295791976235;
    -0.217005249764700,-0.416548665331263,1.30371738487898,0.942283694453100,0.685824376618625,0.428914001412121,-0.882359952552588,0.848286448392744;
    0.491816068565266,0.883892895420125,0.199679784233786,-0.265476088261787,0.578486941662368,0.442697357558016,0.155963283136431,0.0607668467598737;
    0.456732319301315,0.396579249797196,-0.221621147700460,0.188511532226322,0.618041449119957,0.368692250433693,0.262505417369822,0.726348467191325;
    0.780376457412025,0.631475191856788,0.148501099949657,0.343887473877647,0.534372155425152,1.05837805191760,0.915204578799338,0.147280705485665;
    0.434112882498393,0.236687057696059,0.896767939288486,0.372592018730685,0.900686999874267,0.276633204433106,-0.179925993211438,0.341618502608860;
    0.592321024038859,0.523228372926596,-0.476051591637316,0.118190064075887,0.528407061817157,0.873799607847566,0.805781357913859,0.764873201084413;
    -0.118561036573671,0.0512397579844393,0.101291874739315,0.843223118402246,0.303925734693218,0.0157542634691025,-0.0735086967383276,0.111130002912412];
k = [1.18268945682478;1.22461226785541;-1.51093160836411;-0.986772963759577;-0.284824772926098;0.262328607451660;1.51207062478154;-0.580167411514362];

zin = x*v;
z = sigmoid(zin);
yin = z*w;
y = sigmoid(yin);
pin = y*k;
p = sigmoid(pin);

p = sigmoid(sigmoid(sigmoid(x*v)*w)*k);
