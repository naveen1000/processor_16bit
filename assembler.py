codes={
    "ADD": "00000", 
    "SUB": "00001",
    "AND": "00010",
    "OR" : "00011",
    "XOR": "00100",
    "INV": "00101",
    "SHL": "00110",
    "MOV": "00111",
    "LDI": "01000",
    "JZ" : "01001",
    "INC": "01010",
    "DEC": "01011",
    "HLT": "01100",
    "JC" : "01101",
    "JNZ": "01110",
    "JMP": "01111",
    "LDM": "10000",
    "STM": "10001",
    "R0" : "0000", 
    "R1" : "0001", 
    "R2" : "0010", 
    "R3" : "0011",
}

dreg_codes={
    "R0" : "000", 
    "R1" : "001", 
    "R2" : "010", 
    "R3" : "011",
}

f = open("machine_code.mem", "w")
lines = [line.rstrip('\n') for line in open('assembly_code.txt')]
print(lines)
'''
for line in lines:
    keys=line.split(" ")
    print(keys)
    s=""
    for count,key in enumerate(keys):
        if count!=1:
            p=codes.get(key)
            if(codes.get(key)==None):
                if(key.isnumeric()):
                    p="{:04b}".format(int(key))
            s=s+str(p)+"_"
        else:
            p=dreg_codes.get(key)
            print("2")
            if(dreg_codes.get(key)==None):
                if(key.isnumeric()):
                    p="{:03b}".format(int(key))
            s=s+str(p)+"_"
    print(s)
    f.write(s+"\n")
'''
for line in lines:
    keys=line.split(" ")
    print(keys)
    s=""
    l= len(keys)
    for i in range(0,l):
        key =keys[i]
        if (i==0 and key.isnumeric()):#check for data to be of 16-bit
            for i in range(0,l):
                key =keys[i]
                p="{:04b}".format(int(key))
                s=s+str(p)+"_"
            break 

        if i!=1:
            p=codes.get(key)
            if(codes.get(key)==None):
                if(key.isnumeric()):
                    p="{:08b}".format(int(key))
            s=s+str(p)+"_"
        else:
            p=dreg_codes.get(key)
            if(dreg_codes.get(key)==None):
                if(key.isnumeric()):
                    p="{:03b}".format(int(key))
            s=s+str(p)+"_"
    if(l==2):
        p="{:08b}".format(0)
        s=s+str(p)+"_"
    elif(l==1):
         p="{:03b}".format(0)
         s=s+str(p)+"_"  
         p="{:08b}".format(0)
         s=s+str(p)+"_"
    else:
        if(len(s)>16):
            pass
        else:
            s=s+"0000"+"_"
        
    print(s)
    f.write(s+"\n")

f.close()
