const r = /((https?:\/\/)?(www\.)?[a-zA-Z\d][a-zA-Z\d-]+[a-zA-Z\d]\.[^\s]{2,})/i
const rr = /([a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})/gi
let ret = "https://www.test.fr"

// ret = ret.match(rr)
ret = rr.test(ret)

console.log(ret)
