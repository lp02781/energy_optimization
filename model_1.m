function y = model_1(x)

v = [0.328429628692565,-0.930786882547338,-0.455998004056572,-0.471848723003463,-0.284272372660496,-0.513167284847104,0.431485587231205,-0.556713859817971;
    0.539540295784450,-3.72477867905218,-0.771791691663839,-0.776287902791926,-0.967370575590645,-0.702373254622293,0.380866625409591,-1.11493731404653];
w = [1.43291821592291;2.44750582264466;-0.934966085151303;-0.781436665811130;-1.24838994287737;-1.22468331463778;1.35826616674511;-0.191862477330314];

zin = x*v;
z = sigmoid(zin);
yin = z*w;
y = sigmoid(yin);

y = sigmoid(sigmoid(x*v)*w);