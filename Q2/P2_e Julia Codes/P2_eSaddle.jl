using DifferentialEquations
using Plots
gr(size=(500,500), show = true)  #use the gr backend for plotting

function parameterized_acdc(du,u,p,t)
    x,y,z = u
    #ax,bx,zx,nzx,ay,by,xy,nxy,dy,xz,nxz,yz,nyz,dz,s = p
 du[1] = -u[1] + ((0.039+6.1*100)/(1+100+(u[3]/(1.3e-5))^(2.32)))                  #dx/dt
 du[2] = -1.05*u[2] + (((4.3e-3)+(5.7*100))/(1+100+(u[1]/(7.9e-4))^(2)))             #dy/dt
 du[3] = -1.04*u[3] + (1/(1+((u[1]/12e-2)^(2))+((u[2]/11e-3)^(2))))     #dz/dt
end

u0 = [5.734,5.147e-3,4.209e-4]                      #intial conditions for cell #1
tspan = (0.0,100.0)                     #start and end time
prob = ODEProblem(parameterized_acdc,u0,tspan)     #Create an ODE problem for the fxn
sol = solve(prob)                       #Solve the system
#Plot the results; the vars=(0,1) argument specifies to plot X (column 1 of sol)
#vs t (column 0 of sol)
plt1 = plot(sol,vars=(0,3), xaxis="t", yaxis = "Z", label= "Z vs. Time for cell 1 @ S = 100 above Saddle" )
display(plt3)

u0 = [7.1675,6.43375e-3,5.26125e-4]                      #intial conditions for cell #2
tspan = (0.0,100.0)                     #start and end time
prob = ODEProblem(parameterized_acdc,u0,tspan)     #Create an ODE problem for the fxn
sol = solve(prob)                       #Solve the system
#Plot the results; the vars=(0,1) argument specifies to plot X (column 1 of sol)
#vs t (column 0 of sol)
plt2 = plot!(sol,vars=(0,3), xaxis="t", yaxis = "Z", label= "Z vs. Time for cell 2 @ S = 100 above Saddle" )
display(plt3)

u0 = [4.3005,3.86025e-3,3.15675e-4]                      #intial conditions for cell #3
tspan = (0.0,100.0)                     #start and end time
prob = ODEProblem(parameterized_acdc,u0,tspan)     #Create an ODE problem for the fxn
sol = solve(prob)                       #Solve the system
#Plot the results; the vars=(0,1) argument specifies to plot X (column 1 of sol)
#vs t (column 0 of sol)
plt3 = plot!(sol,vars=(0,3), xaxis="t", yaxis = "Z", label= "Z vs. Time for cell 3 @ S = 100 above Saddle" )
display(plt3)
