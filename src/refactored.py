""" KerrOrbits.py Solves differential equations describing orbits of test particles (i.e., particles of negligible mass) in the equatorial plane of a Kerr (uncharged, rotating) black hole using Boyer-Lindquist coordinates. Covers Schwarzschild black holes in Schwarzschild coordinates if you set a=0. Cannot handle orbits outside the equatorial plane. Based on equation 13 in "Precise relativistic orbits in Kerr and Kerr-(anti) de Sitter spacetimes", G V Kraniotis, arXiv:gr-qc/0405095v5 13 Oct 2004 Uses scipy.integrate to solve the equations and matplotlib.pyplot to display paths. """ 
from __future__ import division 
import math,scipy.integrate,matplotlib.pyplot 
class EnumError(Exception): 
    def __init__(self,varname,varlist): 
        Exception.__init__(self,varname+" must be one of "+", ".join(varlist))
        
# Coding constants (no physics, just labels) 
ELQ_INDICES="IE","IL","IQ" 
for i in range(len(ELQ_INDICES)): 
    globals()[ELQ_INDICES[i]]=i 
    
TERMINATE_TYPES="FAILED","ESCAPED","CRASHED","TIMED_OUT","UNKNOWN" 
for i in range(len(TERMINATE_TYPES)): 
    globals()[TERMINATE_TYPES[i]]=i 
    
# Physical constants - Newton's G and the speed of light, c 
PATH_TYPES="SPACELIKE","LIGHTLIKE","TIMELIKE" 
for i in range(len(PATH_TYPES)): 
    globals()[PATH_TYPES[i]]=i-1 
PATH_DIRECTIONS="INWARD","OUTWARD" 
for i in range(len(PATH_DIRECTIONS)): 
    globals()[PATH_DIRECTIONS[i]]=2*i-1 
    G_SI=6.67e-11 
    c_SI=3e8 

# Evaluate the system of differential equations 
class KerrEquatorialSpacetime: 
    def __init__(self,M,a,G=1,c=1): 
        # Store black hole parameters 
        self.__M,self.__a=M,a 
        # Store unit constants 
        self.__G,self.__c=G,c 
    
    def radiusM(self): 
        return self.__G*self.__M/(self.__c*self.__c) 
    
    def __minmaxL(self,E,R): 
        M,a,G,c=self.__M,self.__a,self.__G,self.__c 
        discrim=math.sqrt(-4*c**2*R**2*G**2*M**2 \ 
                            +2*c**2*(-R**3*E**2+2*c**2*R**3+a**2*c**2*R)*G*M \ 
                            +c**4*R**2*(R**2+a**2)*E**2 \ 
                            -c**4*c**2*R**4 \ 
                            -a**2*c**4*c**2*R**2
                            ) 
        L1=(2*a*E*G*M+discrim)/(2*G*M-c**2*R) 
        L2=(2*a*E*G*M-discrim)/(2*G*M-c**2*R) 
        return (L1,L2) 
    
    def minL(self,E,R): 
        return min(self.__minmaxL(E,R)) 
    
    def maxL(self,E,R): 
        return max(self.__minmaxL(E,R)) 
    
    def __de(self,t,y,args=None): 
        r=y[1] 
        r2=r*r 
        r3=r2*r 
        rhosq=self.__rho1*r+self.__rho2*r2+self.__rho3*r3 
        return [self.__p0/(r2*r2)+self.__p1/r3+self.__p2/r2, 
                y[0], \ 
                (self.__phi0+self.__phi1*r)/rhosq, \ 
                (self.__t0+self.__t1*r+self.__t3*r3)/rhosq] 
        
    def orbit(self,pathType,pathDirection,E,L,r0,rmax,dtau,taumax): 
        # Convert the orbit parameters into the prefactors for the 
        # differential equations 
        if not pathType in (globals()[pt] for pt in PATH_TYPES): 
            raise EnumError("pathType",PATH_TYPES) 
        if not pathDirection in (globals()[pd] for pd in PATH_DIRECTIONS): 
            raise EnumError("pathDirection",PATH_DIRECTIONS) 
        musq=pathType*self.__c*self.__c 
        GM=self.__G*self.__M 
        self.__rho1=-(self.__a**2)*(self.__c**2) 
        self.__rho2=2*GM 
        self.__rho3=-(self.__c**2) 
        self.__p0=-3*GM*((L-self.__a*E)**2)/(self.__c**2) 
        self.__p1=L**2+(self.__a**2)*musq-(self.__a*E)**2 
        self.__p2=-musq*GM/(self.__c**2) 
        self.__phi0=2*GM*(L-self.__a*E) 
        self.__phi1=-(self.__c**2)*L 
        self.__t0=self.__phi0*self.__a 
        self.__t1=-(self.__a**2)*(self.__c**2)*E 
        self.__t3=-(self.__c**2)*E 
        # Initialise track with proper time zero and initial 
        # values for dr/dtau,r,phi,t in a list 
        tau=[0] 
        drdtau2=((r0**2+self.__a**2)*E-self.__a*L)**2 \ 
        - (r0**2+self.__a**2-2*GM*r0/(self.__c**2))*(musq*r0**2+(L-self.__a*E)**2) 
        if drdtau2<0: 
            print("Negative (dr/dtau)^2",drdtau2," - setting to zero") 
            drdtau2=0 
        y=[[pathDirection*math.sqrt(drdtau2)/(r0*r0),r0,0,0]] 
        # Set up the integrator, and feed it the initial values 
        r=scipy.integrate.ode(self.__de).set_integrator("dopri5") 
        r.set_initial_value(y[0],tau[0]) 
        # Run the orbit 
        rmin=1.01*(GM/(self.__c**2)+math.sqrt(GM/(self.__c**2)-self.__a**2)) 
        while r.successful() and rmin<=r.y[1] and r.y[1]<=rmax and r.t<=taumax: 
            r.integrate(r.t+dtau) 
            tau.append(r.t) 
            y.append(r.y) 
        # Return a list of proper times and corresponding coordinates 
            self.exitReason="UNKNOWN"
            if not r.successful(): 
                self.exitReason="FAILED" 
            elif rmin>r.y[1]: 
                self.exitReason="CRASHED" 
            elif r.y[1]>rmax: 
                self.exitReason="ESCAPED" 
            elif r.t>taumax: 
                self.exitReason="TIMED_OUT" 
            
            return [tau,y] 
            
            # Create a plot from a list of trajectories 
def plot(trajectories,title,rmax,rstep,filename=None): 
    fig=matplotlib.pyplot.figure() 
    ax=fig.add_subplot(111, projection='polar') 
    for trajectory in trajectories: 
        tau,y,colour,linewidth,label=trajectory 
        phi_path=[p[2] for p in y] 
        r_path=[p[1] for p in y] 
        ax.plot(phi_path,r_path,colour,linewidth=linewidth,label=label) 
    ax.set_rmax(rmax) 
    ax.set_rticks([r*rstep for r in range(int(math.ceil(rmax/rstep)))]) 
    ax.set_title(title) 
    ax.set_xticklabels([]) 
    ax.legend(loc=2,bbox_to_anchor=(0.8,0.15)) 
    if not filename is None: 
        fig.savefig(filename) 
        
def optimiseLaunch(st,E,Lcra,Lesc,froot): 
    while True: 
        Ltry=(Lesc+Lcra)/2 
        RM=st.radiusM() 
        orbitData=st.orbit(TIMELIKE,INWARD,E,Ltry,10*RM,15*RM,0.001,1000) 
        if st.exitReason=="ESCAPED": 
            Lesc=Ltry 
            ttau=orbitData[1][-1][-1]/orbitData[0][-1] 
            print("Escaped - t/tau="+str(ttau)+" L="+str(Ltry)) 
        elif st.exitReason=="CRASHED" or st.exitReason=="FAILED": 
            Lcra=Ltry 
            print("Crashed - L="+str(Ltry)) 
        else: 
            print("Failed at L="+str(Ltry) + \ 
                "\nExit reason: "+TERMINATE_TYPES[st.exitReason]) 
            break 
        
        if abs(Lesc-Lcra)<0.00000001: 
            print("Found optimum - building plots") 
            orbitData=st.orbit(TIMELIKE,INWARD,E,Lesc,50*RM,55*RM,0.001,1000) 
            ttau=orbitData[1][-1][-1]/orbitData[0][-1] 
            plot([orbitData+["#000000",1,"L="+str(Lesc)]], \ 
                    "Best: E="+str(E)+", t/tau="+str(ttau),60,10,froot+"1.png") 
            plot([orbitData+["#000000",1,"L="+str(Lesc)]], \ 
                    "Best: E="+str(E)+", t/tau="+str(ttau),10,1,froot+"2.png") 
            break 

def optimiseLaunches(st,E): 
    RM=st.radiusM() 
    Lcra=0 
    for i in range(11): 
        Lesc=st.maxL(E,50*RM)*i/10 
        print("Trying escape trajectory - L="+str(Lesc)) 
        orbitData=st.orbit(TIMELIKE,INWARD,E,Lesc,10*RM,15*RM,0.001,1000) 
        if st.exitReason==ESCAPED: 
            print("Found - beginning optimisation") 
            break 
        else: 
            raise ValueError("Couldn't find non-crashing orbit") 
        
        optimiseLaunch(st,E,Lcra,Lesc,"Best_"+str(E)+"_Max_") 
        Lcra=0 
        for i in range(11): 
            Lesc=st.minL(E,50*RM)*i/10 
            print("Trying escape trajectory - L="+str(Lesc)) 
            orbitData=st.orbit(TIMELIKE,INWARD,E,Lesc,10*RM,15*RM,0.001,1000) 
            if st.exitReason==ESCAPED: 
                print("Found - beginning optimisation") 
                break 
            else: 
                raise ValueError("Couldn't find non-crashing orbit") 
            
            optimiseLaunch(st,E,Lcra,Lesc,"Best_"+str(E)+"_Min_")
             
st=KerrEquatorialSpacetime(1,0.99) 
optimiseLaunches(KerrEquatorialSpacetime(1,0.99),4) 
matplotlib.pyplot.show()

Reference: https://www.physicsforums.com/threads/using-black-holes-to-time-travel-into-the-future.938858/page-2#post-5943810