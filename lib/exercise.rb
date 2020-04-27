
require 'byebug'
def zip(*arrs)
 arrs.transpose
end

def prizz_proc(arr,prc_1,prc_2)
    arr.select {|ele|(prc_1.call(ele)||prc_2.call(ele))&& !(prc_1.call(ele) && prc_2.call(ele))}
end

def zany_zip(*arrs)
    new_sub=[]
    new_arrs=[]
    length=arrs.max_by(&:size).size
    (0...length).each do |row|
        (0...arrs.length).each do |col|
            new_sub<<arrs[col][row]
        end
        new_arrs<<new_sub
        new_sub=[]
    end
    new_arrs
end
# heed reference

def maximum(arr,&prc)
    if arr.empty?
        return nil
    end
    max=0
    idx=0 #why must i have this line:scope!
    new_arr=arr.map {|ele| prc.call(ele)}
    new_arr.each_with_index do |ele,i|
        if ele>=max
            max=ele
            idx=i
        end
    end
    arr[idx]
end

def my_group_by(arr,&prc)
    hash=Hash.new{|k,v| v=[]}
    arr.each do |ele|
        hash[prc.call(ele)]<<=ele
    end
    hash
end

def max_tie_breaker(arr,prc_1,&prc_2)
    if arr.empty?
        return nil
    end

    idx=find_index(arr,prc_2)

    max=prc_2.call(arr[idx])
    counter=arr.count{|ele| prc_2.call(ele)==max}

    if counter==1
        return arr[idx]  
    else
        arr_1=arr.select{|ele| prc_2.call(ele)==max}
        idx=find_index(arr_1,prc_1)
        return arr_1[idx]
    end
end

def find_index(arr,prc)
    idx=0
    max=0
    new_arr=arr.map {|ele| prc.call(ele)}
    new_arr.each_with_index do |ele,i|
        if ele>max
            max=ele
            idx=i
        end
    end
    idx
end

def silly_syllables(sent)
    words = sent.split(" ")
    words.map { |word| word_convert(word) }.join(" ")
end

def word_convert(word)
    chars = word.split("")
    vowel_indices = []
    chars.each_with_index do |char, i|
        if "aeiouAEIOU".include?(char)
            vowel_indices << i
        end
    end
    start_idx = vowel_indices[0]
    end_idx = vowel_indices[-1]
    if vowel_indices.length < 2
        word
    else
        word[start_idx..end_idx]
    end
end





