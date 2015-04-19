require_relative '../ceasar_crypter'

describe CeasarCrypter do
  let(:crypter) { CeasarCrypter.new 9 }
  context 'encrypt by key of 9' do
    it 'returns the text' do
      given_text = 'YZENVZJ WLVI RLWXRSV QNVZ'
      result = 'HINWEIS FUER AUFGABE ZWEI'
      expect(crypter.decrypt(given_text)).to eq result
    end
  end
end
