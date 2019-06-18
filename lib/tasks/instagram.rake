
namespace :instagram do
  task login: :environment do
    @agent = Mechanize.new
    @agent.get('https://www.instagram.com/accounts/login/?force_classic_login') do |page|

        page.forms[0]['username'] = 'henriquebreim'

        page.forms[0].submit

    response = @agent.get('https://www.instagram.com/graphql/query/?query_hash=d04b0a864b4b54837c0d870b0e77e076&variables={"id":"2235923019","include_reel":true,"fetch_mutual":false,"first":12,"after":"QVFEV3NwVDhlZVdMV1U3ZDlpYUFZblJhOGgtTUw5VlRjYnQ1MEhmbW1IZnJ1ZGRnSWJNMWU2dHE3U2o2ZWJEblkwZkFKN1JBU1lTN0ZVOVhTcXZkcEdkdQ=="}')
    puts response.body
   end





    #puts agent.cookies


   # puts response.body


  end
end