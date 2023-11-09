using TextAnalysis

struct TextEntropyCalculator
    bigrams::Dict{Tuple{String, String}, Int}
    singlegrams::Dict{String, Int}
    total_bigrams::Int
    total_singlegrams::Int

    function TextEntropyCalculator(sentences::Vector{Vector{String}})
        print("Calculating bigrams and singlegrams...")
        bigrams = Dict{Tuple{String, String}, Int}()
        singlegrams = Dict{String, Int}()

        for words in sentences
            # 文の先頭と末尾に START と END を追加
            for i in 1:length(words) - 1
                bg = (words[i], words[i + 1])
                bigrams[bg] = get(bigrams, bg, 0) + 1

                # シングルグラムのカウント
                sg = words[i]
                singlegrams[sg] = get(singlegrams, sg, 0) + 1
            end
            # 最後の単語のカウントを更新
            singlegrams[words[end]] = get(singlegrams, words[end], 0) + 1
        end

        total_bigrams = sum(values(bigrams))
        total_singlegrams = sum(values(singlegrams))

        println("total_bigrams: ", total_bigrams)
        println("total_singlegrams: ", total_singlegrams)

        new(bigrams, singlegrams, total_bigrams, total_singlegrams)
    end
end

function create_grams(words::Vector{String})
    bigrams = Dict{Tuple{String, String}, Int}()
    singlegrams = Dict{String, Int}()

    for i in 1:length(words) - 1
        bg = (words[i], words[i + 1])
        bigrams[bg] = get(bigrams, bg, 0) + 1
        sg = words[i]
        singlegrams[sg] = get(singlegrams, sg, 0) + 1
    end
    singlegrams[words[end]] = get(singlegrams, words[end], 0) + 1

    return bigrams, singlegrams
end

function calculate_entropy(calculator::TextEntropyCalculator, sentence::String)
    words = split("START " * sentence * " END")
    entropy = 0.0

    for i in 2:length(words) - 1
        bg = (words[i], words[i + 1])
        bg_count = get(calculator.bigrams, bg, 0)
        sg_count = get(calculator.singlegrams, words[i], 0)
        sg_count_before = get(calculator.singlegrams, words[i-1], 0)

        if sg_count > 0
            p_singlegram = sg_count / calculator.total_singlegrams
        else
            p_singlegram = 0
        end

        if bg_count > 0 && sg_count > 0
            p_bigram = bg_count / sg_count_before
        else
            p_bigram = 0
        end

        p_combined = 0.5 * p_singlegram + 0.5 * p_bigram
        println(p_combined)
        if p_combined > 0
            entropy -= log(p_combined)
        else
            return Inf # 交差エントロピーは無限大になる
        end
    end

    return entropy / (length(words) - 1)
end

