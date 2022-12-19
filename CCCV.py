#!/usr/bin/env python
# coding: utf-8

# In[1]:


import matlab.engine
import json
import numpy as np


# In[3]:


eng = matlab.engine.start_matlab()


# In[14]:


def simpleCCCV(applied_current):
    out = json.loads(eng.CCCVPy(applied_current))
    #assert len(out) == 1 and out[0]['exit_reason'] == 4 or \
    #    len(out) == 2 and out[0]['exit_reason'] in {2,5} and out[1]['exit_reason'] == 4
    return out


# In[11]:


def startCCCV(applied_current):
    out = simpleCCCV(applied_current)
    for d in out:
        for k,v in d.items():
            if isinstance(v, list):
                d[k] = np.array(v)
    return out


# In[12]:


def CCCVforMaxTimeOptim(applied_current):
    out = simpleCCCV(applied_current)
    return out[-1]['time'][0][-1]

