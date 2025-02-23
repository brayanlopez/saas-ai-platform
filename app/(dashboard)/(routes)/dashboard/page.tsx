import { useRouter } from "next/navigation";
import { ArrowRight } from "lucide-react";

import { tools } from "@/commons/constants";
import { Card } from "@/components/ui/card";
import { cn } from "@/lib/utils";

const DashboardPage = (): React.ReactNode => {
  const router = useRouter()
  return (
    <div>
      <div className="mb-8 space-y-4">
        <h2 className="text-2xl md:text-4xl font-bold text-center">
          Explore the power of AI
        </h2>
        <p className="text-muted-foreground font-light text-sm md:text-lg text-center">
          Chat with AI - Experience the power of AI
        </p>
      </div>
      <div className="px-4 md:px-20 lg:px-32 space-y-4">
        {tools.map((tool) => (
          <Card
            key={tool.href}
            className="p-4 border-black/5 flex items-center justify-between hover:shadow-md transition cursor-pointer"
            // title={tool.label}
            onClick={() => router.push(tool.href)}
          >
            <div className="flex items-center gap-x-4">
              <div className={cn("p-2 w-fit rounded-md", tool.bgColor)}>
                <tool.icon classnames={cn("w-8 h-8", tool.color)} />
                <div className="font-semibold">{tool.label}</div>
              </div>
            </div>
            <ArrowRight className="w-5 h-5"/>
          </Card>
        ))}
      </div>
    </div>
  );
};

export default DashboardPage;
