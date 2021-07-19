def state_eval(c, state):
    out = 0
    if state == 0: #reset
        if c == 'r':
            state = 0
        elif c == 'a':
            state = 1
        elif c == 'b':
            state = 2
        
    elif state == 1: # sa
        if c == 'r':
            state = 0
        elif c == 'a':
            state = 1
        elif c == 'b':
            state = 3
    elif state == 2: #sb
        if c == 'r':
            state = 0
        elif c == 'a':
            state = 4
        elif c == 'b':
            state = 2
    elif state == 3: #sab
        if c == 'r':
            state = 0
        elif c == 'a':
            state = 5
        elif c == 'b':
            state = 2
    elif state == 4: #sba
        if c == 'r':
            state = 0
        elif c == 'a':
            state = 1
        elif c == 'b':
            state = 6
    elif state == 5: #saba
        if c == 'r':
            state = 0
        elif c == 'a':
            state = 1
        elif c == 'b':
            state = 6
            out = 1
    elif state == 6: #sbab
        if c == 'r':
            state = 0
        elif c == 'a':
            state = 5
            out = 1
        elif c == 'b':
            state = 2
    return state, out


f=open("TRACEFILE.txt","w")

strInp = "rabbababaa"
N = len(strInp)
pre_state = 0
nxt_state = 0
nxt_state_x = 0 # this state is dont care here
pre_out = 0
nxt_out = 0

for i in range(N) :
    c = strInp[i]
    
    
    if c == 'r':
        f.write("100 0 0\n")  
        f.write("101 0 0\n") 

    elif c == 'a': # a = 1
        nxt_state, nxt_out = state_eval(c, pre_state)
        f.write("010 " + str(nxt_out) + " 1\n") 
        nxt_state_x, nxt_out = state_eval(c, nxt_state) # here state is not important 
        f.write("011 " + str(nxt_out) + " 1\n") 
        pre_state = nxt_state
        pre_out = nxt_out
    elif c == 'b': # b = 0
        nxt_state, nxt_out = state_eval(c, pre_state)
        f.write("000 " + str(nxt_out) + " 1\n")  
        nxt_state_x, nxt_out = state_eval(c, nxt_state) # here state is not important 
        f.write("001 " + str(nxt_out) + " 1\n") 
        pre_state = nxt_state
        pre_out = nxt_out
f.close()


