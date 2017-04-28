next = () ->
  url = document.getElementById("PDF").src
  num = url.slice 86, 90
  num = parseInt num
  num = num + 1
  padded = pad num, 4
  document.getElementById("PDF").src = "https://my.hrw.com/math12/na_cc/hsm_larson/student/pdf/english/alg2/alg2_cc_na_lar_12_#{padded}.pdf"

back = () ->
  url = document.getElementById("PDF").src
  num = url.slice 86, 90
  num = parseInt num
  num = num - 1
  padded = pad num, 4
  document.getElementById("PDF").src = "https://my.hrw.com/math12/na_cc/hsm_larson/student/pdf/english/alg2/alg2_cc_na_lar_12_#{padded}.pdf"

custom = () ->
  url = document.getElementById("PDF").src
  num = document.getElementById("customnum").value
  num = parseInt num
  padded = pad num, 4
  document.getElementById("PDF").src = "https://my.hrw.com/math12/na_cc/hsm_larson/student/pdf/english/alg2/alg2_cc_na_lar_12_#{padded}.pdf"

pad = (number) ->
  if number<=9999
    number = ("000"+number).slice(-4)
  return number

window.onload = () ->
  document.getElementById('next').onclick = next
  document.getElementById('back').onclick = back
  document.getElementById('submit').onclick = custom
