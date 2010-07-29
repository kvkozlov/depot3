d=60
n=123
b=[]
a=[]
(1..n).each do |m|
  @a=[]
  16.downto(0) do |k|
    @a << m[k]   
 end
  b << @a
end
b.each do |l|
 ## print l.to_s+"\n"
end

print b[3][16-2]