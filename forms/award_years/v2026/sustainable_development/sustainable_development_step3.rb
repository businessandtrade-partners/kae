class AwardYears::V2026::QaeForms
  class << self
    def development_step3
      @development_step3 ||= proc do
        about_section :development_c_section_header, "" do
          section "your_sustainable_development"
        end

        textarea :vision_and_strategy, "Vision and Strategy" do
          classes "word-max-strict text-words-max"
          ref "C 1"
          required
          context %(
            <p>In this section, answer the following questions by providing clear evidence, data, or examples and referencing supporting materials to showcase your organisation's sustainability vision and strategy.</p>
            <ol>
              <li>What is your organisation's long-term vision for sustainability and how does it align with your organisation's core values?</li>
              <ul>
                <li>Briefly describe your organisation and how it has embraced sustainability. Was this process incremental or transformational?</li>
                <li>Explain how sustainability objectives are embedded within your business strategy and model.</li>
                <li>How are your objectives aligned with the Sustainable Development Goals to deliver outcomes such as climate stability, healthy ecosystems, resource security, meeting basic needs, well-being, decent work, etc.?</li>
              </ul>
              <li>What short-term milestones have you set to measure progress?</li>
              <ul>
                <li>Provide key performance indicators used within your organisation - explain how they are established and tracked and any measures taken in the event they are not met.</li>
                <li>Explain how you measure success and ensure continuous improvement.</li>
                <li>What specific steps, roadmaps, and timelines are in place?</li>
                <li>Highlight how your approach represents best practice and the extent to which this sets a sector benchmark.</li>
              </ul>
              <li>Provide a 15-word description of your organisation's commitment to and practice in sustainability. This summary will be used in publicity material if your application is successful.</li>
            </ol>
            <p>Previous examples have included:</p>
            <p>Empowering swift, scalable transitions to locally owned, low-carbon energy.</p>
            <p>Challenging boundaries of what is possible in sustainable construction through bespoke design and offsite manufacturing</p>

          )
          pdf_context %(
            <p>In this section, answer the following questions by providing clear evidence, data, or examples and referencing supporting materials to showcase your organisation's sustainability vision and strategy.</p>
            <p>
              1. What is your organisation's long-term vision for sustainability and how does it align with your organisation's core values?

              \u2022 Briefly describe your organisation and how it has embraced sustainability. Was this process incremental or transformational?
              \u2022 Explain how sustainability objectives are embedded within your business strategy and model.
              \u2022 How are your objectives aligned with the Sustainable Development Goals to deliver outcomes such as climate stability, healthy ecosystems, resource security, meeting basic needs, well-being, decent work, etc.?
            </p>
            <p>
              2. What short-term milestones have you set to measure progress?

              \u2022 Provide key performance indicators used within your organisation - explain how they are established and tracked and any measures taken in the event they are not met.
              \u2022 Explain how you measure success and ensure continuous improvement.
              \u2022 What specific steps, roadmaps, and timelines are in place?
              \u2022 Highlight how your approach represents best practice and the extent to which this sets a sector benchmark.
            </p>
            <p>
              3. Provide a 15-word description of your organisation's commitment to and practice in sustainability. This summary will be used in publicity material if your application is successful.
            </p>
            <p>Previous examples have included:</p>
            <p>
              Empowering swift, scalable transitions to locally owned, low-carbon energy.
              Challenging boundaries of what is possible in sustainable construction through bespoke design and offsite manufacturing
            </p>
          )
          rows 6
          words_max 750
        end

        textarea :environmental_sustainability, "Environmental Sustainability" do
          classes "word-max-strict text-words-max"
          ref "C 2"
          required
          context %(
            <p>In this section, answer the following questions by providing clear evidence, data, or examples and referencing supporting materials to showcase your organisation's environmental sustainability.</p>
            <ol>
              <li>How does your organisation reduce greenhouse gas emissions and work towards net-zero?</li>
              <li>How do you prepare for climate risks and ensure business resilience?</li>
              <li>What efficiency measures do you implement to minimise resource consumption?</li>
              <li>How do you integrate circular economy principles (for example: design for longevity; eliminate waste and pollution; extend product lifecycle; regenerate natural systems; promote a shift to circular business models)?</li>
              <li>What biodiversity and sustainable land use practices are in place?</li>
            </ol>
          )
          pdf_context %(
            <p>In this section, answer the following questions by providing clear evidence, data, or examples and referencing supporting materials to showcase your organisation's environmental sustainability.</p>
            <p>
              1. How does your organisation reduce greenhouse gas emissions and work towards net-zero?
              2. How do you prepare for climate risks and ensure business resilience?
              3. What efficiency measures do you implement to minimise resource consumption?
              4. How do you integrate circular economy principles (for example: design for longevity; eliminate waste and pollution; extend product lifecycle; regenerate natural systems; promote a shift to circular business models)?
              5. What biodiversity and sustainable land use practices are in place?
            </p>
          )
          rows 6
          words_max 750
        end

        textarea :social_sustainability, "Social Sustainability" do
          classes "word-max-strict text-words-max"
          ref "C 3"
          context %(
            <p>
              In this section, answer the following questions by providing clear evidence, data, or examples and referencing supporting materials to showcase your organisation's social sustainability.
            </p>
            <ol>
              <li>How do you support fair labour practices, workforce well-being and motivation, and professional development?</li>
              <li>What diversity, equity, and inclusion initiatives are implemented?</li>
              <li>How does your business engage with and support local/global communities?</li>
              <li>What steps do you take to enhance sustainability knowledge and understanding throughout your organisation and beyond?</li>
              <li>What steps do you take towards ethical sourcing and upholding human rights within your supply chain?</li>
            </ol>
          )
          pdf_context %(
            <p>
              In this section, answer the following questions by providing clear evidence, data, or examples and referencing supporting materials to showcase your organisation's social sustainability.
            </p>
            <p>
              1. How do you support fair labour practices, workforce well-being and motivation, and professional development?
              2. What diversity, equity, and inclusion initiatives are implemented?
              3. How does your business engage with and support local/global communities?
              4. What steps do you take to enhance sustainability knowledge and understanding throughout your organisation and beyond?
              5. What steps do you take towards ethical sourcing and upholding human rights within your supply chain?
            </p>
          )
          required
          rows 6
          words_max 750
        end

        textarea :economic_sustainability, "Economic Sustainability" do
          classes "word-max-strict text-words-max"
          ref "C 4"
          required
          context %(
            <p>
              In this section, answer the following questions by providing clear evidence, data, or examples and referencing supporting materials to showcase your organisation's economic sustainability.
            </p>
            <ol>
              <li>How does your organisation integrate environmental, social and governance principles in financial and operational decisions?</li>
              <li>What policies govern sustainable and fair supply chain procurement?</li>
              <li>How is your organisation innovating for sustainability e.g. through investing in technology, market innovation, and new business models?</li>
              <li>How do you track progress and continuously improve your sustainability strategy?</li>
            </ol>
          )
          pdf_context %(
            <p>
              In this section, answer the following questions by providing clear evidence, data, or examples and referencing supporting materials to showcase your organisation's economic sustainability.
            </p>
            <p>
              1. How does your organisation integrate environmental, social and governance principles in financial and operational decisions?
              2. What policies govern sustainable and fair supply chain procurement?
              3. How is your organisation innovating for sustainability e.g. through investing in technology, market innovation, and new business models?
              4. How do you track progress and continuously improve your sustainability strategy?
            </p>
          )
          rows 6
          words_max 750
        end

        textarea :governance_and_accountability, "Governance and Accountability" do
          classes "word-max-strict text-words-max"
          ref "C 5"
          required
          context %(
            <p>
              In this section, answer the following questions by providing clear evidence, data, or examples and referencing supporting materials to showcase your organisation's governance and accountability.
            </p>
            <ol>
              <li>How is sustainability embedded in leadership and governance?</li>
              <ul>
                <li>Identify the individual(s) responsible for sustainability at the board and operational levels.</li>
                <li>Describe leadership's commitment to sustainability.</li>
              </ul>
              <li>How do you demonstrate and communicate your commitment to sustainability?</li>
              <ul>
                <li>Specify any frameworks and certifications used or achieved (e.g., Global Reporting Initiative (GRI), Task Force on Climate-related Financial Disclosures (TCFD), Race to Zero, Science Based Targets Initiative (SBTi), B Corp).</li>
                <li>How is sustainability incorporated into your website and the products or services you offer?</li>
              </ul>
              <li>How do you collaborate with stakeholders in your sustainability efforts?</li>
              <ul>
                <li>Describe how you collaborate and partner with employees, investors, policymakers, and NGOs.</li>
              </ul>
            </ol>
          )
          pdf_context %(
            <p>
              In this section, answer the following questions by providing clear evidence, data, or examples and referencing supporting materials to showcase your organisation's governance and accountability.
            </p>
            <p>
              1. How is sustainability embedded in leadership and governance?
              \u2022 Identify the individual(s) responsible for sustainability at the board and operational levels.
              \u2022 Describe leadership's commitment to sustainability.
            </p>
            <p>
              2. How do you demonstrate and communicate your commitment to sustainability?
              \u2022 Specify any frameworks and certifications used or achieved (e.g., Global Reporting Initiative (GRI), Task Force on Climate-related Financial Disclosures (TCFD), Race to Zero, Science Based Targets Initiative (SBTi), B Corp).
              \u2022 How is sustainability incorporated into your website and the products or services you offer?
            </p>
            <p>
              3. How do you collaborate with stakeholders in your sustainability efforts?
              \u2022 Describe how you collaborate and partner with employees, investors, policymakers, and NGOs.
            </p>
          )
          rows 7
          words_max 950
        end
      end
    end
  end
end
