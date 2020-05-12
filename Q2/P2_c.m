%%Symbolic variables
syms x z;

%%Parameters
    ax = 1.5; 
    bx = 5.0; 
    zx = 0.4;
    nzx = 2.7;
    xz = 1.5;
    nxz = 2.7;
    deltaz = 1.0;
    
%%Ranges
 s_low = linspace(0,1,100)
 s_high = linspace(4,10,100)
 x0 = [0,0]
 x_ss = zeros(100)
    
%%Main loop
    for i=1:100
        s = s_low(i)
        eqn1 = -x + (ax+bx*s)/(1+s+(z/zx)^nzx) ==0;
        eqn2= -deltaz*z + 1/(1+(x/xz)^nxz)==0;
        sol = vpasolve([eqn1,eqn2],[x,z],x0)
        
        x_ss(i) = double(sol.x)
        x0 = [double(sol.x),double(sol.z)]
       
    end
   
  %%Plot for low S values
figure;
hold on
plot(s_low,x_ss,'b')
xlabel('S')
ylabel('Xss')

    for i=1:100
        s = s_high(i)
        eqn1 = -x + (ax+bx*s)/(1+s+(z/zx)^nzx) ==0;
        eqn2= -deltaz*z + 1/(1+(x/xz)^nxz)==0;
        sol = vpasolve([eqn1,eqn2],[x,z],x0)
        
        x_ss(i) = double(sol.x)
        x0 = [double(sol.x),double(sol.z)]
       
    end
   
  %%Plot for high S values
plot(s_high,x_ss,'b')
xlabel('S')
ylabel('Xss')
hold off



   