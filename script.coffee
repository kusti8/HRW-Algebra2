update = (num) ->
  document.getElementById("customnum").value = num

checkRoman = (roman) ->
  /^[a-zA-Z]+$/.test(roman)

next = () ->
  url = document.getElementById("PDF").src
  num = url.split("12_")[1]
  num = num.split(".")[0]
  if num == 'xix'
    num = '-1'
  if checkRoman num
    num = fromRoman num.toUpperCase()
    num = parseInt num
    num = num + 1
    num = (toRoman num).toLowerCase()
    padded = num
  else
    num = parseInt num
    num = num + 1
    padded = pad num, 4
  update num
  document.getElementById("PDF").src = "https://my.hrw.com/math12/na_cc/hsm_larson/student/pdf/english/alg2/alg2_cc_na_lar_12_#{padded}.pdf"

back = () ->
  url = document.getElementById("PDF").src
  num = url.split("12_")[1]
  num = num.split(".")[0]
  if checkRoman num
    num = fromRoman num.toUpperCase()
    num = parseInt num
    num = num - 1
    num = (toRoman num).toLowerCase()
    padded = num
  else
    num = parseInt num
    num = num - 1
    padded = pad num, 4
  update num
  document.getElementById("PDF").src = "https://my.hrw.com/math12/na_cc/hsm_larson/student/pdf/english/alg2/alg2_cc_na_lar_12_#{padded}.pdf"

custom = () ->
  url = document.getElementById("PDF").src
  num = document.getElementById("customnum").value
  if !checkRoman num
    num = parseInt num
    padded = pad num, 4
  else
    padded = num
  alert padded
  document.getElementById("PDF").src = "https://my.hrw.com/math12/na_cc/hsm_larson/student/pdf/english/alg2/alg2_cc_na_lar_12_#{padded}.pdf"

toc = () ->
  document.getElementById("customnum").value = "viii"
  custom()

pad = (number) ->
  if number<=9999
    number = ("000"+number).slice(-4)
  return number

toRoman = (num) ->
  result = ''
  decimal = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  roman = ["M", "CM","D","CD","C", "XC", "L", "XL", "X","IX","V","IV","I"];
  for i in [0..decimal.length]
    while num%decimal[i] < num
      result += roman[i]
      num -= decimal[i];
  result

fromRoman = (str) ->
  result = 0
  decimal = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  roman = ["M", "CM","D","CD","C", "XC", "L", "XL", "X","IX","V","IV","I"]
  for i in [0..decimal.length]
    while str.indexOf(roman[i]) == 0
      result += decimal[i]
      str = str.replace(roman[i],'')
  result

window.onload = () ->
  document.getElementById('next').onclick = next
  document.getElementById('back').onclick = back
  document.getElementById('toc').onclick = toc
  document.getElementById('submit').onclick = custom
