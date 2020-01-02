import NaturalLanguage

public struct WordLexicalClassPair: CustomStringConvertible {
    public var description: String {
        return "\"\(self.word)\": \(self.lexicalClass)"
    }
    
    let word: String
    let lexicalClass: String
}

public class NLPFacade {
    
    private static let tagger = NLTagger(tagSchemes: [.lexicalClass])
    
    //Returns the dominant language of an input string.
    public class func dominantLanguage(for string: String) -> String? {
        let language = NLLanguageRecognizer.dominantLanguage(for: string)
        
        return language?.rawValue
    }
    
    public class func partsOfSpeech(for text: String) -> [WordLexicalClassPair]{
        var result = [WordLexicalClassPair]()
        self.tagger.string = text
        self.tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: NLTokenUnit.word, scheme: NLTagScheme.lexicalClass, options: [.omitPunctuation, .omitWhitespace]) {(tag, range) -> Bool in
            let wordLexicalClass = WordLexicalClassPair(word: String(text[range]), lexicalClass: (tag?.rawValue ?? "unknown"))
            result.append(wordLexicalClass)
            return true
        }
        
        return result
    }
}

