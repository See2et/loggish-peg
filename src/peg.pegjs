sentence
  = head:declarativeSentence { return head }
	/ head:interrogativeSentence { return head }
declarativeSentence "平叙文" = head:nounPhrase _ tail:verbPhraseGroup { return { head, tail } }

interrogativeSentence "疑問文"
  = head:markerInt _ tail:basisInt ((_ / "") "?" / "") { return { head, tail } }
markerInt "疑問マーカー"
  = head:"su" { return head }
basisInt "疑問文根幹"
  = head:nounPhraseInt _ tail:verbPhraseGroupInt { return { head, tail } }
verbPhraseGroupInt "疑問動詞句群"
  = head:verbPhraseInt _ tail:verbPhraseGroupInt { return { head, tail } }
	/ head:verbPhraseInt { return head }
verbPhraseInt "疑問動詞句"
  = head:tenseVerbInt _ tail:objectNounPhraseInt { return { head, tail } }
	/ head:tenseVerbInt { return head }
tenseVerbInt "疑問時制動詞"
  = head:tense _ tail:nounPhraseInt { return { head, tail } }
objectNounPhraseInt "疑問目的名詞句"
  = head:"to" _ tail:nounPhraseInt { return { head, tail } }
nounPhraseInt	"疑問名詞句"
  = head:directiveInt _ tail:nounPhraseInt { return { head, tail } }
  / head:directiveInt { return head }
  / head:contentWord _ tail:nounPhraseInt { return { head, tail } }
	/ head:contentWord { return head }
directiveInt "疑問指示語"
  = head:"ni" { return head }

verbPhraseGroup "動詞句群"
  = head:verbPhrase _ tail:verbPhraseGroup { return { head, tail }}
  / head:verbPhrase { return head }
verbPhrase "動詞句"
  = head:tenseVerb _ tail:objectNounPhrase { return { head, tail } }
  / head:tenseVerb { return head }
tenseVerb "時制動詞"
  = head:tense _ tail:nounPhrase { return { head, tail } }
objectNounPhrase "目的名詞句"
  = head:"to" _ tail:nounPhrase { return { head, tail } }
nounPhrase	"名詞句"
  = head:contentWord _ tail:nounPhrase { return { head, tail } }
	/ head:contentWord { return head }

tense "時制"
  = "li" / "lo"
contentWord "内容語"
  = head:(cv (cv)+) { return head.join("") }
	/  head:(cvc (cv)+) { return head.join("") }
cvc
  = head:(c v c) { return head.join("") }
cv
  = head:(c v) { return head.join("") }
c "子音"
  = "p" / "t" / "k"/ "s" / "m"/ "n" / "l" / "f"
v "母音"
  = "a" / "e" / "i" / "o"/ "u"
_ "空白"
  = [ \t\n\r]*
