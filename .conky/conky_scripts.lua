function conky_pad(padding, value)
    return string.format(string.format('%%%is', conky_parse(padding)), conky_parse(value))
end
