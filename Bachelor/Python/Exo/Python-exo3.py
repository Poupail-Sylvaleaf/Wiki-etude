# définir une fonction qui prend en paramètre la liste des mms
def solution(mms):
    print(f'Taille du gateau : {len(mms)}')
# partir d'1 part de taille 1
# si une part est différente, arrêter la comparaison, et augmenter de nouveau la taille de part
    for size_slice in range(1,len(mms)):
       # print(f'Taille de part : {size_slice}')
# comparer cette part avec toutes les autres parts
        slices_are_different = False
        for start_other_slice in range(size_slice,len(mms),size_slice):
            #print(f'Index de la prochaine part à comparer : {start_other_slice}')
            #print(f'Ref : {mms[0:size_slice]}, Current : {mms[start_other_slice:start_other_slice + size_slice]}')
            if mms[0:size_slice] != mms[start_other_slice : start_other_slice+size_slice]:
                #arreter la comparaison et augmenter tout de suite la taille de la part            
                slices_are_different = True
                break 
            if not slices_are_different : #verification de l'égalité des parts
                return int(len(mms) / size_slice)
        return 1                            
# si toutes les parts sont égales, alors on a la taille de la part
#    return len(mms) / size_slice

#solution('abababababab')
solution('abcabcabcabc')