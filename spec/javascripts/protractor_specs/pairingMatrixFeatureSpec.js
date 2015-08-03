describe('Pairing Matrix', function() {

  beforeEach(function(){
    browser.get('http://localhost:4000');
  });

  it('has a title', function() {
    expect(browser.getTitle()).toEqual('Pairing Matrix');
  });

});
