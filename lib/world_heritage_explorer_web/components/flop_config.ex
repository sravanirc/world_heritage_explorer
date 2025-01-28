defmodule WorldHeritageExplorerWeb.FlopConfig do
  def table_style do
    [
      table_attrs: [
        class:
          "p-1 text-sm w-full border-collapse border border-slate-400 break-all rounded-xl shadow-lg bg-lime-50"
      ],
      thead_th_attrs: [
        class: "p-1 bg-gray-50 border border-slate-300 break-all",
        # Enable sorting on headers],
        "data-sortable": "true"
      ],
      tbody_td_attrs: [class: "p-1 px-2 border border-slate-300 break-all min-w-[4rem] "],
      tbody_tr_attrs: [class: "p-1 px-2 border border-slate-300 break-all hover:bg-gray-50"]
    ]
  end

  def pagination_style do
    [
      page_links: {:ellipsis, 3},
      pagination_link_aria_label: fn page_number -> "Go to page #{page_number}" end,
      # Custom styles for horizontal pagination
      pagination_list_attrs: [
        # Flexbox for horizontal layout
        class: "  px-2 pagination flex justify-end space-x-2 mx-2  rounded-lg "
      ],
      pagination_link_attrs: [
        # Styling for individual links
        class: "p-1 px-2 rounded border-gray-300 border-x-2 hover:bg-white text-green-600"
      ],
      wrapper_attrs: [
        class: " flex justify-end text-center items-stretch mt-4"
      ],
      previous_link_content: Phoenix.HTML.raw("← Previous"),
      previous_link_attrs: [
        class:
          "px-2 mr-2 border rounded-lg border-slate-500 bg-green-400 shadow-lg hover:text-white "
      ],
      page_links: {:ellipsis, 3},
      next_link_content: Phoenix.HTML.raw("Next →"),
      next_link_attrs: [
        class:
          "px-2 ml-2 border rounded border-slate-500 bg-green-400 shadow-lg hover:text-white "
      ]
    ]
  end
end
