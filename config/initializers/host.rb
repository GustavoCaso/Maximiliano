if Rails.env.delvelopment?
  HOST_WO_HTTP = "localhost:300"
else
  HOST_WO_HTTP = "www.maximilianodeyork.com"
end
HOST = "http://#{HOST_WO_HTTP}"