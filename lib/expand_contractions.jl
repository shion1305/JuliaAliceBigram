# 省略形を展開する
# 省略形と完全形のマッピング
contractions = Dict(
    "i’m" => "i am",
    "you’re" => "you are",
    "he’s" => "he is",
    "she’s" => "she is",
    "it’s" => "it is",
    "we’re" => "we are",
    "they’re" => "they are",
    "i’ve" => "i have",
    "you’ve" => "you have",
    "we’ve" => "we have",
    "they’ve" => "they have",
    "i’ll" => "i will",
    "you’ll" => "you will",
    "he’ll" => "he will",
    "she’ll" => "she will",
    "it’ll" => "it will",
    "we’ll" => "we will",
    "they’ll" => "they will",
    "isn’t" => "is not",
    "aren’t" => "are not",
    "wasn’t" => "was not",
    "weren’t" => "were not",
    "haven’t" => "have not",
    "hasn’t" => "has not",
    "hadn’t" => "had not",
    "won’t" => "will not",
    "wouldn’t" => "would not",
    "don’t" => "do not",
    "doesn’t" => "does not",
    "didn’t" => "did not",
    "can’t" => "cannot",
    "couldn’t" => "could not",
    "shouldn’t" => "should not",
    "mightn’t" => "might not",
    "mustn’t" => "must not",
    "that’s" => "that is",
    "who’s" => "who is",
    "what’s" => "what is",
    "where’s" => "where is",
    "when’s" => "when is",
    "why’s" => "why is",
    "how’s" => "how is",
    "there’s" => "there is",
    "let’s" => "lets",
    "you’d" => "you would",
    "he’d" => "he would",
    "she’d" => "she would",
    "that’ll" => "that will",
    "they’d" => "they would",
    "i’d" => "i would",
    "needn’t" => "need not",
    "mayn’t" => "may not",
    "shan’t" => "shall not",
)


# テキスト内の省略形を置換する関数
function expand_contractions(text)
    for (contraction, full_form) in contractions
        text = replace(text, contraction => full_form)
    end
    return text
end

