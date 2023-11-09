using Plots
using Measures
function generate_bigram_graph(bigram_data, filename)
    entropies = [count / total_counts for (_, _, count) in bigram_data]
    labels = [string(first, " ", second) for (first, second, _) in bigram_data]
    bar_plot = bar(labels, entropies, title="Bigram Entropies", xlabel="Bigrams", ylabel="Entropy",
        legend=false, xrotation=45, xticks=(1:length(labels), labels), size=(800, 600), margin=5mm, xguidefontsize=10, yguidefontsize=10)
    savefig(bar_plot, filename * ".png")
end