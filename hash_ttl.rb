class HashTtl
  def initialize(ttl)
    @ttl = ttl
    @hash = {}
    @key_time = {}
  end

  def [](key)
    return unless @key_time[key]
    current_time = Time.now
    if current_time - @key_time[key] > @ttl
      @hash.delete(key)
      @key_time.delete(key)
      nil
    else
      @hash[key]
    end
  end

  def []=(key, value)
    @key_time[key] = Time.now
    @hash[key] = value
  end
end

