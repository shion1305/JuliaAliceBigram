using Plots
using Measures
function generate_bigram_graph(bigram_data, filename)
    total_counts = sum([count for (_, _, count) in bigram_data])

    # バイグラムごとの確率とエントロピーを計算
    probabilities = [count / total_counts for (_, _, count) in bigram_data]
    entropies = [-log(p) for p in probabilities]

    # バイグラムのラベル（表示用）
    labels = [string(first, " ", second) for (first, second, _) in bigram_data]

    print(labels)
    # グラフを作成（サイズ、マージン、フォントサイズを調整）
    bar_plot = bar(labels, entropies, title="Bigram Entropies", xlabel="Bigrams", ylabel="Entropy",
               legend=false, xrotation=45, xticks=(1:length(labels), labels), size=(800, 600), margin=5mm, xguidefontsize=10, yguidefontsize=10)

    # グラフをファイルに保存（例：PNG形式）
    savefig(bar_plot, filename * ".png")
end