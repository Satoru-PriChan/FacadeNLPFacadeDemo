import NaturalLanguage

let text = "The Façade is simple yet useful"
print(text)

let language = NLPFacade.dominantLanguage(for: text) ?? "unknown"
print(language)

let result = NLPFacade.partsOfSpeech(for: text)
print(result)


