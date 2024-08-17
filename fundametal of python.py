#!/usr/bin/env python
# coding: utf-8

# In[2]:


print("hello world");


# In[2]:


x = 22 
print(x)


# In[3]:


y = "Aya Oraby"
print(y)


# In[4]:


type(y)


# In[6]:


x,y,z = "aya","helmy" , "oraby "
print(x,y,z)


# In[ ]:


name = ["aya","helmy", "Oraby"]


# In[ ]:


x,y,z = name


# In[7]:


print(x,y,z)


# In[14]:


# testvarcase 

test_variable = "ayaoraby"
print(test_variable)


# In[16]:


test_variable = 'ayaoraby'
print(test_variable)


# In[22]:


x = "aya"+"oraby"
y = 4
print(x,y)


# In[ ]:





# # Data Types
# 

# In[23]:


type ( 12 - 4)


# In[24]:


type (12 + 16.00)


# In[25]:


type ( 2+2j)


# In[26]:


1 > 5


# In[ ]:


# String


# In[27]:


'Single quote'


# In[28]:


"""Aya Helmy Oraby """


# In[31]:


a = "aya oraby"
print (a[4])
print(a*3)


# In[32]:


["aya","helmy","oraby"]


# In[35]:


var  = ["aya" , 3 , ["aya", "helmy"]]
print (var[2])


# In[ ]:


#tuples 


# In[37]:


tuples = (1,2,3,4)
type(tuples)


# In[39]:


#sets 
daily_pints = {1,2,3,5}
type(daily_pints)


# In[44]:


aya = {1,2,3}
oraby = {3,4,6}

print(aya| oraby)
print(aya&oraby)
print(aya^oraby)


# In[54]:


#dictionaries 
diction = {"name":"helmy", "detail" : ["aya","oraby"]}
type(diction) 
# del diction["name"]
# print(diction)




# In[56]:


#operator
10 ==10




# In[61]:


10 ==10


# In[64]:


x = " aya"
y = "oraby "
x!=y


# In[65]:


(20 > 45 and 45 >94)


# In[67]:


icecream = "i love ice cream"
"love" not in icecream


# In[78]:


if 23 > 5 : print( "great")
elif 43 > 55: print("notgreat")
else: print("sad")


# In[85]:


#for loop 
integer = [1,2,3,4,5]
for number in integer:
    print(number)
    print("yap")
    print( number +number )
    
    






# In[89]:


name = { "name" : "aya" , "fathername": ["Helmy", "Oraby"]}
for names in name.items() :
    print(names)


# In[91]:


# Nested Fpr Loop
flavor = ["aya","oraby"]
topping = ["aya", "oraby "]
for one in flavor:
    for two in topping:
        print(one,two)


# In[107]:


#while loop

number = 0 
while number < 6 :
    print(number)
    if number == 3:
        break
    number = number+1
else :     
    print("No longer")


# In[111]:


def function():
    print("hello")
function()


# In[117]:


def numsq(number,power):
    print(number**power)
numsq(4,3)    


# In[121]:


def num(*num):
    print(num[0]*num[1])
num(1,2,3)    


# In[122]:


def numsq(number,power):
    print(number**power)
numsq(power = 4, number = 3)    


# In[130]:


def num(*num):
    print(num[0])
num(5,4,5,6)   


# In[132]:


#conerting data 
num  = 4 

type(num)
num = str(num)
type(num)




# In[133]:


list = [1,2,3]
type(list)


# In[137]:


#dict 

log = "i like to party"
set(log)




# In[139]:


list = [1,3,5,6,3,2,5,3]
set(list)


# In[157]:


dictype = {"name": "Aya" , "Age":23}
type(dictype)




# In[162]:


dictype.items()


# In[163]:


dictype.values()


# In[164]:


dictype.keys()


# In[ ]:




