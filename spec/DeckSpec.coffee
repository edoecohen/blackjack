assert = chai.assert
expect = chai.expect

describe 'deck', ->
  deck = null
  hand = null


  beforeEach ->
    checkSpy = sinon.spy(Hand.prototype, 'checkScore');
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49

  describe 'checkScore', ->
    # it 'checkScore method should exist', ->
      # expect(hand.checkScore).to.be.a('function')

    it 'should invoke checkScore after a hit', ->
      hand.hit()
      expect(checkSpy).to.have.been.called

