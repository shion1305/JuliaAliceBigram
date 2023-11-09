function calc_entropy(bigrams::Vector{Tuple{SubString{String},SubString{String}}}, bigram_counts)
    #     create array of (word1, word2, count) tuples
    entropy_details = []
    cross_entropy = 0.0
    total_bigrams = sum(values(bigram_counts))  # すべてのバイグラムの出現回数の合計
    for bigram in bigrams
        count = get(bigram_counts, bigram, 0)  # バイグラムが存在しない場合、0を返す
        #         println(bigram, " ", count)
        #        append to entropy_details
        probability = count / total_bigrams  # 確率を計算
        if -log(probability) == Inf

            continue
        end
        e = -1 * log(probability)
        push!(entropy_details, (bigram[1], bigram[2], e))
        cross_entropy -= log(probability)  # 負の対数を取り、加算
    end
    cross_entropy /= length(bigrams)
    return cross_entropy, entropy_details
end
