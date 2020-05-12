using DifferentialEquations
using Plots
gr(size=(500,500), show = true)  #use the gr backend for plotting

function parameterized_acdc(du,u,p,t)
    x,y,z = u
    #ax,bx,zx,nzx,ay,by,xy,nxy,dy,xz,nxz,yz,nyz,dz,s = p
 du[1] = -u[1] + ((0.039+(6.1*0.02))/(1+0.02+(u[3]/(1.3e-5))^(2.32)))            #dx/dt
 du[2] = -1.05*u[2] + (((4.3e-3)+(5.7*0.02))/(1+0.02+(u[1]/(7.9e-4))^(2)))       #dy/dt
 du[3] = -1.04*u[3] + (1/(1+((u[1]/(12e-2))^(2))+((u[2]/(11e-3))^(2))))          #dz/dt
end

u0 = [0.0,0.0,0.0]                      #intial conditions
tspan = (0.0,100.0)                     #start and end time
prob = ODEProblem(parameterized_acdc,u0,tspan)     #Create an ODE problem for the fxn
sol = solve(prob)                       #Solve the system
#Plot the results; the vars=(0,1) argument specifies to plot X (column 1 of sol)
#vs t (column 0 of sol)
plt1 = plot(sol,vars=(0,1), xaxis="t", yaxis = "X", label= "X vs. Time for S = 0.02" )
display(plt1)

function parameterized_acdc(du,u,p,t)
    x,y,z = u
    #ax,bx,zx,nzx,ay,by,xy,nxy,dy,xz,nxz,yz,nyz,dz,s = p
 du[1] = -u[1] + ((0.039+(6.1*10))/(1+10+(u[3]/(1.3e-5))^(2.32)))            #dx/dt
 du[2] = -1.05*u[2] + (((4.3e-3)+(5.7*10))/(1+10+(u[1]/(7.9e-4))^(2)))       #dy/dt
 du[3] = -1.04*u[3] + (1/(1+((u[1]/(12e-2))^(2))+((u[2]/(11e-3))^(2))))          #dz/dt
end

u0 = [0.0,0.0,0.0]                      #intial conditions
tspan = (0.0,100.0)                     #start and end time
prob = ODEProblem(parameterized_acdc,u0,tspan)     #Create an ODE problem for the fxn
sol = solve(prob)                       #Solve the system
#Plot the results; the vars=(0,1) argument specifies to plot X (column 1 of sol)
#vs t (column 0 of sol)
plt2 = plot!(sol,vars=(0,1), xaxis="t", yaxis = "X", label= "X vs. Time for S = 10" )
display(plt1)

function parameterized_acdc(du,u,p,t)
    x,y,z = u
    #ax,bx,zx,nzx,ay,by,xy,nxy,dy,xz,nxz,yz,nyz,dz,s = p
 du[1] = -u[1] + ((0.039+(6.1*1e5))/(1+1e5+(u[3]/(1.3e-5))^(2.32)))            #dx/dt
 du[2] = -1.05*u[2] + (((4.3e-3)+(5.7*1e5))/(1+1e5+(u[1]/(7.9e-4))^(2)))       #dy/dt
 du[3] = -1.04*u[3] + (1/(1+((u[1]/(12e-2))^(2))+((u[2]/(11e-3))^(2))))          #dz/dt
end

u0 = [0.0,0.0,0.0]                      #intial conditions
tspan = (0.0,100.0)                     #start and end time
prob = ODEProblem(parameterized_acdc,u0,tspan)     #Create an ODE problem for the fxn
sol = solve(prob)                       #Solve the system
#Plot the results; the vars=(0,1) argument specifies to plot X (column 1 of sol)
#vs t (column 0 of sol)
plt3 = plot!(sol,vars=(0,1), xaxis="t", yaxis = "X", label= "X vs. Time for S = 10^5" )
display(plt1)
