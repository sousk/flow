# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :entry do |f|
  f.title 'MyString-latest'
  f.slug 'my-string-latest'
  f.created_at Time.now
  f.body <<-__TEXT__
    This beverage is called sake in English, but in Japanese, sake (酒) or o-sake (お酒) refers to alcoholic drinks in general. The Japanese term for this specific beverage is Nihonshu (日本酒), meaning "Japanese sake".
    Sake is also referred to in English as rice wine. However, unlike true wine, in which alcohol is produced by fermenting the sugar naturally present in fruit, sake is made through a brewing process more like that of beer. To make beer or sake, the sugar needed to produce alcohol must first be converted from starch. But the brewing process for sake differs from beer brewing as well, notably in that for beer, the conversion of starch to sugar and sugar to alcohol occurs in two discrete steps, but with sake they occur simultaneously. Additionally, alcohol content also differs between sake, wine, and beer. Wine generally contains 9–16% alcohol and most beer is 3–8%, whereas undiluted sake is 18–20% alcohol, although this is often lowered to around 15% by diluting the sake with water prior to bottling.
  __TEXT__
end
