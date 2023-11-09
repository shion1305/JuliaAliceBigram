using Plots

using Measures
function generate_bigram_graph(bigram_data, filename)
    entropies = [value for (_, value) in bigram_data[1]]
    labels = [string(words[1], " ", words[2]) for (words, _) in bigram_data[1]]
    bar_plot = bar(labels, entropies, title="Bigram Entropies", xlabel="Bigrams", ylabel="Entropy",
        legend=false, xrotation=45, xticks=(1:length(labels), labels), size=(800, 600), margin=5mm, xguidefontsize=10, yguidefontsize=10)
    savefig(bar_plot, filename * ".png")
end