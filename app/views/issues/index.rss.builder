xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
	xml.channel do
			@issues.each do |issue|
				xml.item do
						xml.title  issue.title
						xml.pubDate issue.created_at.to_s(:rfc822)
						xml.description issue.description
				end
			end
	end
end