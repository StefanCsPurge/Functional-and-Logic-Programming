class Nod:
    def __init__(self, e):
        self.e = e
        self.urm = None
    
class Lista:
    def __init__(self):
        self.prim = None
        

'''
crearea unei liste din valori citite pana la 0
'''
def creareLista():
    lista = Lista()
    lista.prim = creareLista_rec()
    return lista

def creareLista_rec():
    x = int(input("x="))
    if x == 0:
        return None
    else:
        nod = Nod(x)
        nod.urm = creareLista_rec()
        return nod
    
'''
tiparirea elementelor unei liste
'''
def tipar(lista):
    tipar_rec(lista.prim)
    
def tipar_rec(nod):
    if nod != None:
        print (nod.e)
        tipar_rec(nod.urm)
        

# a. Determine if a list has even number of elements,
# without computing the length of the list.
'''
Mathematical model

                                  | true if L1 ∈ ∅        (it parses the list using 2 steps)
checkEvenNoOfElems_rec(L1...Ln) = | false if L2 ∈ ∅
                                  | checkEvenNoOfElems_rec(L3...Ln) otherwise
'''


def checkEvenNoOfElems(a_list):
    return checkEvenNoOfElems_rec(a_list.prim)

def checkEvenNoOfElems_rec(nod):
    if nod is None:
        return True
    if nod.urm is None:
        return False
    return checkEvenNoOfElems_rec(nod.urm.urm)



# b. Delete all occurrences of an element from a list.
'''
Mathematical model

                               | ∅ if the list is empty        
removeElement_rec(L1...Ln,E) = | removeElement_rec(L2...Ln, E) if L1 = E
                               | L1 ⊕ removeElement_rec(L2...Ln, E) otherwise
                                                  
In the end this non-destructive function returns the first node of a new list that does not have that given element "elem".

'''

def removeElement(a_list, elem):
    updatedList = Lista()
    updatedList.prim = removeElement_rec(a_list.prim, elem, None)
    return updatedList

def removeElement_rec(old_node, elem, prev):
    if old_node == None:
        return None
    if old_node.e != elem:
        nod = Nod(old_node.e)
        nod.urm = removeElement_rec(old_node.urm, elem, nod)
        return nod
    elif old_node.e == elem:
        if prev == None:
            return removeElement_rec(old_node.urm, elem, prev)
        prev.urm = old_node.urm
        return removeElement_rec(old_node.urm, elem, prev)


'''
program pentru test 
'''
        
def main():
    my_list = creareLista()
    tipar(my_list)
    if checkEvenNoOfElems(my_list):
        print("The list has an even number of elements")
    else:
        print("The list does NOT have an even number of elements")

    x = int(input("Element to be deleted: "))
    newList = removeElement(my_list, x)
    tipar(newList)
    # after the multiple runs, they seem to work like a charm
    
main() 
    
    
    
    
    
